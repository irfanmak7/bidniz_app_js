class Business < ApplicationRecord
    belongs_to :users, dependent: :destroy, required: false
    has_many :comments, dependent: :destroy

    has_many :businesses_tags
    has_many :tags, through: :businesses_tags
end
