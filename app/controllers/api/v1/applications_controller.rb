class Api::V1::ApplicationsController < ApplicationController
  def index
    render json: Application.all, status: :ok
  end

  def create
    application = Application.new(application_params)
    if application.save!
      render json: application, status: :created
    else
      render json: application.errors, status: :unprocessable_entity
    end
  end

  def update
    application = Application.find_by(token: params[:token])
    if application.update!(application_params)
      render json: application, status: :ok
    else
      render json: application.errors, status: :unprocessable_entity
    end
  end

  private

  def application_params
    params.permit(:name)
  end
end
