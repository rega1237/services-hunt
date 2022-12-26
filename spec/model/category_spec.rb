require "rails_helper"
require_relative "shared"

RSpec.describe Category, type: :model do
  include_context "request_context"

  before :all do
    @category = Category.new(name: "Category")
    @category.image.attach(io: File.open(Rails.root.join("app", "assets", "images", "logo_wb.png")), filename: "logo_wb.png", content_type: "image/png")
    @category.save
  end

  describe "validations" do
    it "is valid with valid attributes" do
      expect(@category).to be_valid
    end

    it "is not valid without a name" do
      @category.name = nil
      expect(@category).to_not be_valid
    end

    it "is not valid without an image" do
      @category.image.purge
      expect(@category).to_not be_valid
    end
  end
end