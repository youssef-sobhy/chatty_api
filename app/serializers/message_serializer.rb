class MessageSerializer < ActiveModel::Serializer
  attributes :number, :chat_number, :application_token, :body, :created_at

  def chat_number
    object.chat.number
  end

  def application_token
    object.application.token
  end
end
