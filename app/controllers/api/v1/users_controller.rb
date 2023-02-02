module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user 
      skip_before_action :authenticate
    
      def name
        if @user
          json_string = UserSerializer.new(@user).serialized_json
          render json: json_string 
        else 
          render_400(nil, I18n.t("api.v1.users.name.failed"))
        end
      end
    
      private 
    
      def set_user
        @user = User.find_by(random_id: params[:random_id])
      end
    end
  end
end
