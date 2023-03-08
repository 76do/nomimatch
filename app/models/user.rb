class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :name, presence: true
  validates :password, length: {minimum: 3}, if: -> { new_record? || changes[:crypted_password]}
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password]}
  validates :password_confirmation, presence: true, if: -> {new_record? || changes[:crypted_password]}
  validates :random_id, uniqueness: true
  validates :email, uniqueness: true
  has_many :api_keys
  has_many :requests
  has_many :user_rooms
  has_many :rooms, through: :user_rooms
  
  def set_random_id!
    self.random_id = SecureRandom.urlsafe_base64(15)  
  end
  
  def activate_api_key!
    return api_keys.active_token.first if api_keys.active_token.exists?
    api_keys.create!
  end
end
