RSpec.shared_examples 'http status ok' do |schema|
  it "returns a #{schema}" do
    expect(response).to have_http_status(:ok)
    expect(response).to match_json_schema(schema)
  end
end
