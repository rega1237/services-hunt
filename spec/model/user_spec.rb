require 'rails_helper'
require_relative 'shared'

RSpec.describe User, type: :model do
  include_context 'request_context'

  before :all do
    @user = User.new(email: 'rega1237@gmail.com', full_name: 'Rega', admin: true, password: 'password',
                     password_confirmation: 'password')
    @user.skip_confirmation!
    @user.save
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(@user).to be_valid
    end

    it 'is not valid without an email' do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid without a full name' do
      @user.full_name = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid without a password' do
      @user.password = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid without a password confirmation' do
      @user.password_confirmation = nil
      expect(@user).to_not be_valid
    end
  end
end
