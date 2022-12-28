class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :service

  validates :user_id, presence: true
  validates :service_id, presence: true
  validates :rating, presence: true
  validates :title, presence: true
  validates :body, presence: true
end
