class Message < ApplicationRecord
  searchkick callbacks: :queue
  ## Association
  belongs_to :chat, counter_cache: true

  delegate :application, to: :chat

  ## Validations
  validates :body, presence: true
  validates :number, uniqueness: { scope: :chat_id }

  ## Scopes
  scope :search_import, -> { includes(:chat) }
  scope :query, lambda { |query, application_token, chat_number|
    search(
      query,
      fields: %i[body],
      where: { application_token: application_token, chat_number: chat_number },
      order: { created_at: :desc },
      misspellings: { below: 5 }
    )
  }

  private

  def search_data
    {
      body: body,
      chat_number: chat.number,
      application_token: application.token,
      created_at: created_at
    }
  end
end
