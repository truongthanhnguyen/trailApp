class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> {order(created_at: :desc)}
  mount_uploader :picture, PictureUploader
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :user_id, presence: true
  validates :title, presence: true, length: {maximum: Settings.micropost.title_length}
  validates :content, presence: true, length: {maximum: Settings.micropost.content_length}
  validate :picture_size

  private

  # Validates the size of an uploaded picture.
  def picture_size
    if picture.size > Settings.micropost.picture_size.megabytes
      errors.add(:picture, "picture_should_be_less")
    end
  end
end
