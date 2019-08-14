class BusinessSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :address, :price

  has_many :comments
end
