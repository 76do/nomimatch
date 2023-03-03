module ApplicationCable
  class Connection < ActionCable::Connection::Base
    include ActionController::HttpAuthentication::Token::ControllerMethods
    identified_by :current_user

    def connect
      self.current_user = find_verified_user!
    end

    private

    def find_verified_user!
      authenticate_or_request_with_http_token do |token,_options|
        ApiKey.active_token.find_by(access_token: token)&.user
      end
    end
  end
end
