class Business < ApplicationRecord
    belongs_to :users, required: false

end
