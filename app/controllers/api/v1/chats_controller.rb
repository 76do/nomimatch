module Api
  module V1
    class ChatsController < ApplicationController

      def index
        chats_array = current_user.rooms.order(id: :desc).map do |room|
          {
            id: room.id,
            opponent: room.users.opponent(@_current_user),
            chat_message: room.chat_messages,
          }
        end
        render json: chats_array, status: 200
      end
    end
  end
end
