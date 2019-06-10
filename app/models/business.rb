class Business < ApplicationRecord
    belongs_to :users, required: false
    has_many :comments dependent: :destroy
end
