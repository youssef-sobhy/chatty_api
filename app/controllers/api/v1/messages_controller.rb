class Api::V1::MessagesController < ApplicationController
  before_action :prepare_chat

  def index
    render json: @chat.messages, status: :ok
  end

  def update
    message = @chat.messages.find_by(number: params[:number])
    if message.update!(update_params)
      render json: message, status: :ok
    else
      render json: message.errors, status: :unprocessable_entity
    end
  end

  def search
    render json: Message.query(*search_params.values), status: :ok
  end

  private

  def update_params
    params.permit(:body)
  end

  def search_params
    params.permit(:query, :application_token, :chat_number)
  end

  def prepare_chat
    @chat = Chat.find_by_application_token(params[:application_token])
                .find_by(number: params[:chat_number])
  end
end
