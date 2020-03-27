RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  describe 'validation field username' do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_uniqueness_of(:username) }
    it { is_expected.to validate_length_of(:username).is_at_most(50) }
    it { is_expected.to validate_length_of(:username).is_at_least(3) }
  end

  describe 'validation field password' do
    it { is_expected.to have_secure_password }
    it { is_expected.to validate_length_of(:password).is_equal_to(8) }
  end

  describe 'validation relations' do
    it { is_expected.to have_many(:projects).dependent(:destroy) }
  end
end
