RSpec.describe Task, type: :model do
  describe 'validation field name' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'validation relations' do
    it { is_expected.to belong_to(:project) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
  end
end
