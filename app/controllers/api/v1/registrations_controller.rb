module Api
  module V1
    class RegistrationsController < ApplicationController
  
      skip_before_action :authenticate, only: [:create]

      def create
        user = User.new(user_params)
        user.set_random_id!
        if user.save 
          set_access_token!(user)
          json_string = UserSerializer.new(user).serialized_json
          render json: json_string 
        else
          render_400(nil, user.errors.full_messages)
        end
      end

      def update
        user = current_user
        user.update!(update_user_params)
        json_string = UserSerializer.new(user).serialized_json
        render json: json_string 
      end
       
      private

      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end 

      def update_user_params
        params.require(:user).permit(:name)
      end
    end
  end
end
