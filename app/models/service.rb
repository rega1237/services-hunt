class Service < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_one_attached :image, dependent: :destroy
  has_many :service_categories, dependent: :destroy
  has_many :categories, through: :service_categories
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :categories, allow_destroy: true
end
