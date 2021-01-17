class Application < ApplicationRecord
  has_secure_token
  ## Associations
  has_many :chats, dependent: :destroy

  ## Validations
  validates :name, presence: true
  validates :token, uniqueness: true
end
