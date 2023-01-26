module Api
  module V1
    class RegistrationsController < ApplicationController
  
      skip_before_action :authenticate

      def create
        user = User.new(user_params)
        user.set_random_id!
        if user.save 
          set_access_token!(user)
          json_string = UserSerializer.new(user).serialized_json
          render json: json_string 
        else
          puts user.errors.full_messages
          render_400(nil, user.errors.full_messages)
        end
      end
      
      private

      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end 
    end
  end
end
