class Business < ApplicationRecord
    belongs_to :users, required: false
    has_many :comments, required: false
end
