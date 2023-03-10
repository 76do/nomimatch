module Api
  module V1
    class OauthsController < ApplicationController
      #before_actionをつける
      skip_before_action :authenticate
      def oauth 
        login_at(params[:provider])
      end
  
      def callback
        provider = auth_params[:provider]
        if auth_params[:denied].present?
          #200で返す
        end
        byebug
      end
    end 
  end
end
