require 'rails_helper'
require_relative 'shared'

RSpec.describe Service, type: :model do
  include_context 'request_context'

  before :all do
    @service = Service.new(name: "Service", description: "Description", user_id: User.first.id)
    @service.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', "logo_wb.png")), filename: "logo_wb.png", content_type: 'image/png')
    @service.save
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(@service).to be_valid
    end

    it 'is not valid without a name' do
      @service.name = nil
      expect(@service).to_not be_valid
    end

    it 'is not valid without a description' do
      @service.description = nil
      expect(@service).to_not be_valid
    end

    it 'is not valid without a user_id' do
      @service.user_id = nil
      expect(@service).to_not be_valid
    end

    it 'is not valid without an image' do
      @service.image.purge
      expect(@service).to_not be_valid
    end
  end
end