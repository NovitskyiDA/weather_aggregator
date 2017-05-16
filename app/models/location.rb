class Location < ApplicationRecord
  has_and_belongs_to_many :users

  validates :country, :city, presence: true
end
