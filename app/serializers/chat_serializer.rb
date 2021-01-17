class ChatSerializer < ActiveModel::Serializer
  attributes :number, :application_token, :messages_count, :created_at

  def application_token
    object.application.token
  end
end
