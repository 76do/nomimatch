require 'twilio-ruby'

module Api
  module V1
    class RequestsController < ApplicationController
      before_action :set_client
      
      def create
        @client.messages.create(
          from: Rails.application.credentials[:twilio][:phone_number],
          to: params[:phone_number],
          body: build_request_message(params) 
        )        
      end

      private

      def set_client
        @client = Twilio::REST::Client.new Rails.application.credentials[:twilio][:account_sid], Rails.application.credentials[:twilio][:auth_token]
      end
  
      def build_request_message(params)
        name = params[:name]
        shop_url = params[:shop_url]
        dismissal_time = params[:dismissal_time]
        number_of_people = params[:number_of_people] 
        atmosphere = params[:atmosphere]
        message = params[:message] 

        request_message =<<~"EOS"
        【飲み会依頼】
        #{name}さんから飲み会依頼が届いています！
        
        ■依頼詳細
        行きたいお店:#{shop_url}
        希望解散時間:#{dismissal_time}
        希望人数:#{number_of_people}
        飲み会の雰囲気:#{atmosphere}
        メッセージ:#{message}
        EOS
      end
    end
  end
end
