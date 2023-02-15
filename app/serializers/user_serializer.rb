class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email, :random_id
  has_many :requests
end
