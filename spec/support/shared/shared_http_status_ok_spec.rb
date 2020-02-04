RSpec.shared_examples 'http status ok' do |schema|
  it { expect(response).to have_http_status(:ok) }
  it { expect(response).to match_json_schema(schema) }
end
