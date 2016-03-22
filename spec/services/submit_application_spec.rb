require 'rails_helper'

RSpec.describe SubmitApplication do
  let(:url) { 'URL' }
  let(:token) { 'TOKEN' }
  let(:online_application) { build(:online_application) }

  subject(:submit_application) { described_class.new(url, token) }

  describe '#post' do
    subject(:post) { submit_application.post(online_application) }

    describe 'when the request is valid' do
      let(:response) { { 'result' => 'RESPONSE' } }
      let(:expected_response) { { result: 'RESPONSE' } }

      before do
        stub_request(:post, "#{url}/api/submissions").to_return(status: 200, body: response.to_json)
      end

      it 'returns the response with symbilised keys' do
        is_expected.to eql(expected_response)
      end
    end
  end
end