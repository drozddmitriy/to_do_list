RSpec.describe Authenticate, type: :interactor do
  let(:user) { create(:user) }

  describe '.call' do
    context 'when authorized' do
      let(:valid_params) { { username: user.username, password: user.password } }
      let(:context) { described_class.call(params: valid_params) }

      it { expect(context).to be_a_success }
    end

    context 'when unauthorized' do
      let(:invalid_params) { { username: user.username, password: '' } }
      let(:context) { described_class.call(params: invalid_params) }

      it { expect(context).to be_a_failure }
    end
  end
end
