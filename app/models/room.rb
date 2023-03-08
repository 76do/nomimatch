class Room < ApplicationRecord
  has_many :user_rooms
  has_many :chat_messages
  has_many :users, through: :user_rooms
end
