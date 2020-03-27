RSpec.shared_examples 'http status not_found' do
  it 'returns a not_found status code' do
    expect(response).to have_http_status(:not_found)
  end
end
