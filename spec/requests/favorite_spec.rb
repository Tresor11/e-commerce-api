require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  # Authentication test suite
  describe 'POST /auth/login' do
    # create test user
    let!(:admin) { create(:admin) }
    let!(:user) { create(:user) }
    let!(:image) { Rack::Test::UploadedFile.new("#{Rails.root}/spec/support/kid.jpg", 'profile') }
    def item_headers(token)
      {
        'Authorization' => token.to_s,
        'Content-Type' => 'application/json'
      }
    end
    # set headers for authorization
    let(:headers) { valid_headers.except('Authorization') }
    # set test valid and invalid credentials
    let(:admin_credentials) do
      {
        email: admin.email,
        password: admin.password
      }.to_json
    end
    def valid_attributes(id)
      attributes_for(:item,
                     name: 'invalid',
                     contact: 'me@gmail.com',
                     user_id: id,
                     price: 10,
                     image:)
    end

    context 'Item requests' do
      before do
        post '/auth/login', params: admin_credentials, headers:
      end
      it 'return an eampty if thereis no favorite created ' do
        token = json['auth_token']
        get '/favorites', headers: item_headers(token)
        expect(json).to eq([])
      end

      it 'Does not create a favorite without valid parameters' do
        token = json['auth_token']
        post '/favorites', headers: item_headers(token), params: {}
        expect(response.status).to eq(422)
      end

      it 'Create a favorite with valid parameters' do
        token = json['auth_token']
        post '/items', headers: item_headers(token), params: valid_attributes(admin.id)
        id = json['id']
        post '/favorites', headers: item_headers(token), params: { item_id: id }.to_json
        expect(json['created_at']).not_to be(nil)
      end
    end
  end
end
