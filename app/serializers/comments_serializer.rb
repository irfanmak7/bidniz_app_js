class CommentsSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_id
end
