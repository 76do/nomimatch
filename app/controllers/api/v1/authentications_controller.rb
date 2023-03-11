module Api
  module V1
    class AuthenticationsController < ApplicationController

      skip_before_action :authenticate, only: [:create]

      def create
        byebug
        user = login(params[:email], params[:password])
        if user
          byebug
          set_access_token!(user)
          json_string = UserSerializer.new(user).serialized_json
          render json: json_string 
        else
          render_401(nil, I18n.t("api.v1.authentications.create.failed"))
        end
      end
  
      def current_user_info
        json_string = UserSerializer.new(@_current_user).serialized_json
        render json: json_string
      end
  
      def destroy
        logout
        @_current_user.api_keys.active_token.update_all(active: false)
        render json: {}
      end

      private
      
      def form_authenticity_token; end
    end 
  end
end
