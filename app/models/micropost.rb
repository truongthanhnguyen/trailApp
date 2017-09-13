class Micropost < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :user_id, prensence: true
  validates :title, prensence: true, length: {maximum: 140}
  validates :content, prensence: true, length: {maximum: 1440}
end
