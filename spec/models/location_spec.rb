require 'rails_helper'

RSpec.describe Location, type: :model do
  describe 'validation' do
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:country) }
    it { is_expected.to validate_presence_of(:country_code) }
  end

  describe 'associations' do
    it { is_expected.to have_and_belong_to_many(:users) }
    it { is_expected.to have_one(:weather_information).dependent(:destroy) }
  end

  describe 'callbacks' do
    context '#add_location_image' do
    end
  end
end
