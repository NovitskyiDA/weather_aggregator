class Location < ApplicationRecord
  before_create :add_location_image

  has_and_belongs_to_many :users
  has_one :weather_information, dependent: :destroy

  validates :country, :country_code, :city, presence: true
  validates :city, uniqueness: true

  private

  def add_location_image
    self.image = GoogleCustomSearchApi.search(city, searchType: 'image').items[rand(0..10)].link
  end
end
