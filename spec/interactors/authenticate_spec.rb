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

  describe '.call' do
    let(:valid_params) { { username: user.username, password: user.password } }
    let(:context) { described_class.call(params: valid_params) }
    let(:user_test) { User.find_by!(username: context.params[:username]) }

    context 'when set user' do
      it { expect(context.user).to eq(user_test) }
    end

    context 'when set user_name' do
      it { expect(context.user_name).to eq(user_test.username) }
    end

    context 'when set token' do
      let(:token) { JsonWebToken.encode(user_id: context.user.id) }

      it { expect(context.token).to eq(token) }
    end
  end
end
