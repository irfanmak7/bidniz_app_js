class Tag < ApplicationRecord
    has_many :businesses_tags
    has_many :businesses, through: :businesses_tags
end