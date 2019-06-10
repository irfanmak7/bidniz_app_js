class Business < ApplicationRecord
    belongs_to :users, dependent: :destroy
    has_many :comments, dependent: :destroy
end
