module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user!
    end

    private

    def find_verified_user!
      reject_unauthorized_connection unless ApiKey.active_token.find_by(access_token: cookies[:accessToken])&.user
    end
  end
end
