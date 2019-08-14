class CommentsSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_id

  belongs_to :businesses
end
