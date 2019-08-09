class Tag < ApplicationRecord
    has_many :businesses_tags
    has_many :businesses, through: :businesses_tags

    validates :name, presence: true
end