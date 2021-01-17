class ReceiverMessagesWorker
  include Sneakers::Worker

  QUEUE_NAME = 'chatty_receiver.messages'
  from_queue QUEUE_NAME, arguments: { 'x-dead-letter-exchange': "#{QUEUE_NAME}-retry" }

  def work(message)
    body = JSON.parse(message)
    time = parse_time(body['timestamp'])
    application = Application.find_by(token: body['application_token'])
    case body['model']
    when 'Chat'
      application.chats.create!(number: body['number'], created_at: time)
    when 'Message'
      chat = application.chats.find_by(number: body['chat_number'])
      chat.messages.create!(number: body['number'], body: body['message_body'], created_at: time)
    end
    ack!
  rescue StandardError => e
    Sneakers.logger.error e
    reject!
  end

  private

  def parse_time(milliseconds)
    Time.zone.at(milliseconds / 1000).to_datetime
  end
end