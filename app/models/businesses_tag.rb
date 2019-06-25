class BusinessesTag < ApplicationRecord
    belongs_to :business, required: false
    belongs_to :tag, required: false
end