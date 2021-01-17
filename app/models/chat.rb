class Chat < ApplicationRecord
  ## Associations
  has_many :messages, dependent: :destroy
  belongs_to :application, counter_cache: true

  ## Validations
  validates :number, uniqueness: { scope: :application_id }

  ## Scopes
  scope :find_by_application_token, ->(token) { joins(:application).where(applications: { token: token }) }
end
