class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :auth_token

  has_one :worker
end
