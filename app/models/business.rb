class Business < ApplicationRecord
    belongs_to :users, dependent: :destroy, required: false
    has_many :comments, dependent: :destroy
end
