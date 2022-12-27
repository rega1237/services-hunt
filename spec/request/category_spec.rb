require 'rails_helper'
require_relative 'shared'

RSpec.describe Category, type: :request do
  include_context 'request_context'
  
  before :each do
    user = User.first
    login_as(user)
  end

  describe 'GET /categories' do
    it 'new category returns http success' do
      get '/categories/new'
      expect(response).to have_http_status(:success)
    end

    it 'edit category returns http success' do
      get '/categories/cakes/edit'
      expect(response).to have_http_status(:success)
    end

    it 'update category returns http success' do
      patch '/categories/cakes', params: { category: { name: 'test' } }
      expect(response).to have_http_status(:found)
    end

    it 'delete category returns http success' do
      delete '/categories/cakes'
      expect(response).to have_http_status(:found)
    end
  end
end