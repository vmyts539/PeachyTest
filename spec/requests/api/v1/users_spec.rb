require 'rails_helper'

RSpec.describe 'Api::V1::Users', type: :request do
  let(:user) { create(:user) }

  describe 'GET /current' do
    it 'gets current user' do
      headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
      auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, user)
      get('/api/v1/users/current', headers: auth_headers)

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to include(
        'data' => {
          'id' => user.id,
          'email' => user.email,
          'name' => user.name
        }
      )
    end
  end
end
