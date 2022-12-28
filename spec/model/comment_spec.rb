require 'rails_helper'
require_relative 'shared'

RSpec.describe Comment, type: :model do
  include_context 'request_context'

  before :all do
    @comment = Comment.new(user_id: User.first.id, service_id: Service.first.id, rating: 5, title: 'Title',
                           body: 'Body')
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(@comment).to be_valid
    end

    it 'is not valid without a user' do
      @comment.user_id = nil
      expect(@comment).to_not be_valid
    end

    it 'is not valid without a service' do
      @comment.service_id = nil
      expect(@comment).to_not be_valid
    end

    it 'is not valid without a rating' do
      @comment.rating = nil
      expect(@comment).to_not be_valid
    end

    it 'is not valid without a title' do
      @comment.title = nil
      expect(@comment).to_not be_valid
    end

    it 'is not valid without a body' do
      @comment.body = nil
      expect(@comment).to_not be_valid
    end
  end
end
