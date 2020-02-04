RSpec.describe Authenticate, type: :interactor do
  let(:user) { create(:user) }

  describe '.call' do
    context 'when authorized' do
      let(:valid_params) { { username: user.username, password: user.password } }
      let(:context) { described_class.call(params: valid_params) }
      let(:token) { JsonWebToken.encode(user_id: context.user.id) }

      it { expect(context).to be_a_success }
      it { expect(context).to have_attributes(user: user) }
      it { expect(context).to have_attributes(user_name: user.username) }
      it { expect(context).to have_attributes(token: token) }
    end

    context 'when unauthorized' do
      let(:invalid_params) { { username: user.username, password: '' } }
      let(:context) { described_class.call(params: invalid_params) }

      it { expect(context).to be_a_failure }
    end
  end
end
