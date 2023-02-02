require 'twilio-ruby'

module Api
  module V1
    class RequestsController < ApplicationController
      skip_before_action :authenticate
      def create
        render_400(nil, "飲み会依頼の送信に失敗しました。")
      end
    end
  end
end
