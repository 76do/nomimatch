module Api
  module V1
    class RequestsController < ApplicationController
      before_action :set_user, only: [:create]
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
          RequestMailer.with(user: @user, request: @request).request_email.deliver_later
        else
          render_400(nil, "飲み会依頼の送信に失敗しました。")
        end
      end

      private

      def set_user
        @user = User.find_by(random_id: params[:user_random_id])
      end
    end
  end
end
