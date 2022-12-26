class Service < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  has_one_attached :image, dependent: :destroy
  has_many :service_categories, dependent: :destroy
  has_many :categories, through: :service_categories
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :categories, allow_destroy: true

  validates :name, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  validates :image, presence: true
end
