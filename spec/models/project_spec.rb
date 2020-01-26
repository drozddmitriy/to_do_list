RSpec.describe Project, type: :model do
  describe 'validation field name' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'validation relations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:tasks).dependent(:destroy) }
  end
end
