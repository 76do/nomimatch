class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_channel_#{params[:room_id]}"
    @room = Room.find(params[:room_id])
  end

  def unsubscribed
  end

  def chat(data)
    ChatMessage.create!(user: current_user, room: @room, message: data['body'])
    ActionCable.server.broadcast("chat_channel_#{params[:room_id]}", {message: data['body'], user: current_user})
  end
end
