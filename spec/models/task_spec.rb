RSpec.describe Task, type: :model do
  describe 'validation field name' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'validation relations' do
    it { is_expected.to belong_to(:project) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
  end

  describe 'validation scope acts_as_list' do
    let(:user) { create(:user) }
    let(:project) { create(:project, user: user) }
    let(:task) { create(:task, project: project) }

    it { expect(task.acts_as_list_top).to eq(1) }
  end
end
