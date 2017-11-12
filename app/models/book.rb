class Book < ApplicationRecord
  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader
  belongs_to :user
  validates :title, :author, :description, presence: true
end
