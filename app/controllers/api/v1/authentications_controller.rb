module Api
  module V1
    class AuthenticationsController < ApplicationController

      skip_before_action :authenticate

      def create
        user = login(params[:email], params[:password])
        if user
          set_access_token!(user)
          json_string = UserSerializer.new(user).serialized_json
          render json: json_string 
        else
          render_401(nil, 'Login failed')
        end
      end
  
      private
      
      def form_authenticity_token; end
    end 
  end
end
