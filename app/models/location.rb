class Location < ApplicationRecord
  belongs_to :trip
  has_one :address, dependent: :destroy
end
