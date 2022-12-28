require 'rails_helper'
require_relative 'shared'

RSpec.describe User, type: :request do
  include_context 'request_context'

  before :each do
    user = User.first
    login_as(user)
  end

  describe 'GET /services' do
    it 'all services returns http success' do
      get '/services'
      expect(response).to have_http_status(:success)
    end

    it 'show services returns http success' do
      get '/services/olga-cake-s'
      expect(response).to have_http_status(:success)
    end

    it 'new service returns http success' do
      get '/services/new'
      expect(response).to have_http_status(:success)
    end

    it 'edit service returns http success' do
      get '/services/olga-cake-s/edit'
      expect(response).to have_http_status(:success)
    end

    it 'update service returns http success' do
      patch '/services/olga-cake-s', params: { service: { name: 'test', description: 'test' } }
      expect(response).to have_http_status(:found)
    end

    it 'delete service returns http success' do
      delete '/services/olga-cake-s'
      expect(response).to have_http_status(:found)
    end
  end
end
