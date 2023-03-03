class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_#{params[:room_id]}"
    @room = Room.find(params[:room_id])
    ActionCable.server.broadcast "chat_#{params[:room_id], messages: @room.chatMessages}", 
  end

  def unsubscribed
  end

  def chat(data)
    ChatMessage.create!(user: current_user, room: @room, message: data['body'])
    ActionCable.server.broadcast('chat_#{params[:room_id]}', { sender: current_user.id, message: data['body']})
  end
end
