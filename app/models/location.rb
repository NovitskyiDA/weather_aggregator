class Location < ApplicationRecord
  has_and_belongs_to_many :users
  has_one :weather_information, dependent: :destroy

  validates :country, :country_code, :city, presence: true
  validates :city, uniqueness: true
end
