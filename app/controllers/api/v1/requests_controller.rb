module Api
  module V1
    class RequestsController < ApplicationController
      before_action :set_user
      skip_before_action :authenticate

      def create
        RequestMailer.with(user: @user).request_email.deliver_later
        render_400(nil, "飲み会依頼の送信に失敗しました。")
      end

      private

      def set_user
        @user = User.find_by(random_id: params[:user_random_id])
      end
    end
  end
end
