require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_secure_password }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:username).case_insensitive }

    context 'username format' do
      let(:user) { build(:user) }

      subject { user.username }

      it { is_expected.to match(/\A[a-z0-9][[a-z0-9]+[_-]?[a-z0-9]+]{3,15}\z/i) }
    end

    context 'email format' do
      let(:user) { build(:user) }

      subject { user.email }

      it { is_expected.to match(/\A[^@]+@([^@\.]+\.)+[^@\.]+\z/) }
    end
  end
end
