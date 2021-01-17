class Api::V1::ChatsController < ApplicationController
  before_action :prepare_application

  def index
    render json: @application.chats, status: :ok
  end

  private

  def prepare_application
    @application = Application.find_by(token: params[:application_token])
  end
end
