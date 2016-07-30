class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :jwt_token
end
