require 'rails_helper'
require_relative 'shared'

RSpec.describe User, type: :request do
  include_context 'request_context'
  
  describe 'GET /users' do
    it 'show the user profile' do
      user = User.first
      login_as(user)      
      get '/users/rafael-guzman'
      expect(response).to have_http_status(:success)
    end

    it 'get the sign_up view' do
      get '/users/sign_up'
      expect(response).to have_http_status(:success)
    end

    it 'get the edit view' do
      user = User.first
      login_as(user)
      get '/users/edit'
      expect(response).to have_http_status(:success)
    end

    it 'delete the user profile' do
      user = User.first
      login_as(user)
      delete '/users'
      expect(response).to have_http_status(:found)
    end

    it 'get the sign_in view' do
      get '/users/sign_in'
      expect(response).to have_http_status(:success)
    end

    it 'sign_in the user' do
      post '/users/sign_in', params: { user: { email: 'rega1237@mail.com', password: '123456' } }
      expect(response).to have_http_status(:found)
    end

    it 'sign_out the user' do
      user = User.first
      login_as(user)
      delete '/users/sign_out'
      expect(response).to have_http_status(:found)
    end

    it 'create a new user' do
      post '/users', params: { user: { full_name: 'test', email: 'test@mail.com', password: '123456' } }
      expect(response).to have_http_status(:found)
    end
  end
end