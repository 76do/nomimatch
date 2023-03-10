class ApiKey < ApplicationRecord
  DEFAULT_EXPIRES_WEEK = 1.week
  belongs_to :user
  validates :access_token, uniqueness: true, presence: true
  scope :active_token, -> { where('expires_at >= ? and active = true', Time.current) }
  
  def initialize(attributes = {})
    super
    self.active = true
    self.access_token = SecureRandom.uuid
    self.expires_at = DEFAULT_EXPIRES_WEEK.after
  end
end
