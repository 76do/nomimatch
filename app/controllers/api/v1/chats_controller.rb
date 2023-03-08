module Api
  module V1
    class ChatsController < ApplicationController

      def index
        rooms = current_user.rooms.includes(:users, :chat_messages).order('chat_messages.created_at DESC').uniq
        chats_array = rooms.map do |room|
          {
            id: room.id,
            opponent: room.users.reject{|user| user.id == @_current_user.id}.first,
            chat_message: room.chat_messages.order('created_at ASC'),
          }
        end
        render json: chats_array, status: 200
      end
    end
  end
end
