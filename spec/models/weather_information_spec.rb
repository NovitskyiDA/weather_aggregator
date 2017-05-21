require 'rails_helper'

RSpec.describe WeatherInformation, type: :model do
  describe 'validation' do
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:icon) }
    it { is_expected.to validate_presence_of(:current_temp) }
    it { is_expected.to validate_presence_of(:temp_max) }
    it { is_expected.to validate_presence_of(:temp_min) }
    it { is_expected.to validate_presence_of(:humidity) }
    it { is_expected.to validate_presence_of(:pressure) }
    it { is_expected.to validate_presence_of(:wind_speed) }
    it { is_expected.to validate_presence_of(:wind_degree) }
    it { is_expected.to validate_presence_of(:location_id) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:location) }
  end
end
