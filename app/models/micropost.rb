class Micropost < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :user_id, presence: true
  validates :title, presence: true, length: {maximum: Settings.micropost.tittle_length}
  validates :content, presence: true, length: {maximum: Settings.micropost.content_length}
end
