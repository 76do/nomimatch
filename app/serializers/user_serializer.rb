class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email, :random_id
end
