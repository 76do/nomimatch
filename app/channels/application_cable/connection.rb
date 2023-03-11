module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user!
      binding.irb 
    end

    protected

    def find_verified_user!
      binding.irb
      user = ApiKey.active_token.find_by(access_token: cookies[:accessToken])&.user
      reject_unauthorized_connection unless user 
      return user
    end
  end
end
