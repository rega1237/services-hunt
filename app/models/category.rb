class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_one_attached :image

  has_many :service_categories, dependent: :destroy
  has_many :services, through: :service_categories
end
