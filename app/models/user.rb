class User < ApplicationRecord
    has_many :businesses
    has_secure_password
end
