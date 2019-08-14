class UserSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :businesses
  has_many :comments
end
