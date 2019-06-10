class User < ApplicationRecord
    has_many :businesses
    has_many :comments, through: :businesses
    validates :email, presence: true
    validates :email, uniqueness: true
    has_secure_password
end
