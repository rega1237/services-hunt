class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_one_attached :image

  has_many :service_categories, dependent: :destroy
  has_many :services, through: :service_categories

  validates :name, presence: true, uniqueness: true
  validates :image, presence: true
end
