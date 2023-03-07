require 'erb'

module Api
  module V1
    class RequestsController < ApplicationController
      before_action :set_users, only: [:create]
      skip_before_action :authenticate, only: [:create]

      def index
        requests = @_current_user.requests.new_order
        json_string = RequestSerializer.new(requests).serialized_json
        render json: json_string 
      end

      def create
        @request = @user.requests.build(sender_name: params[:name], shop_url: params[:shop], dismissal_time: params[:time],
        number_of_people: params[:numberOfPeople], budget: params[:budget], atmosphere: params[:atmosphere], message: params[:message])
        
        if @request.save
          if @sender_user
            room = Room.create!
            room.users << @user
            room.users << @sender_user
            request_string = <<~TEXT
            #{@user.name}さん 
             
            #{@sender_user.name}さんから以下内容で飲み会依頼が届いています！
            
            ■飲み会依頼
            行きたいお店：#{@request.decorate.shop_url}
            希望解散時間：#{@request.dismissal_time_i18n}
            希望人数：#{@request.number_of_people_i18n}
            予算：#{@request.budget_i18n}
            飲み会の雰囲気：#{@request.decorate.atmosphere_string}
            メッセージ：#{@request.message}
            TEXT
            ChatMessage.create(user: @sender_user, room: room, message: request_string)
          end
        
          RequestMailer.with(user: @user, request: @request).request_email.deliver_later
        else
          render_400(nil, "飲み会依頼の送信に失敗しました。")
        end
      end

      private

      def set_users
        @user = User.find_by(random_id: params[:user_random_id])
        @sender_user = User.find_by(random_id: params[:senderUserId])
      end
    end
  end
end
