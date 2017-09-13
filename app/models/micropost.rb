class Micropost < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :user_id, prensence: true
  validates :title, prensence: true, length: {maximum: Setting.micropost.tittle_length}
  validates :content, prensence: true, length: {maximum: Setting.micropost.content_length}
end
