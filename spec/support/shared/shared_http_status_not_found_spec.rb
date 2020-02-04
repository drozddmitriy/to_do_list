RSpec.shared_examples 'http status not_found' do
  it { expect(response).to have_http_status(:not_found) }
end
