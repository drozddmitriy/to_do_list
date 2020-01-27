RSpec.describe Comment, type: :model do
  describe 'validation relations' do
    it { is_expected.to belong_to(:task) }
  end

  describe 'validation field text' do
    it { is_expected.to validate_presence_of(:text) }
  end

  describe 'validation field file' do
    let(:comment) { create(:comment, task: build(:task)) }
    let(:file) { File.open(Rails.root.join('spec/fixtures/test.jpg')) }

    context 'when valid file' do
      before { comment.file = file }

      it { expect(comment).to be_valid }
    end

    context 'when wrong format' do
      before do
        allow_any_instance_of(ImageUploader).to receive(:extension_whitelist).and_return(%w[format1 format2])
        comment.file = file
      end

      it { expect(comment).to be_invalid }
    end

    context 'when wrong size' do
      before do
        allow_any_instance_of(ImageUploader).to receive(:size_range).and_return(0..1)
        comment.file = file
      end

      it { expect(comment).to be_invalid }
    end
  end
end
