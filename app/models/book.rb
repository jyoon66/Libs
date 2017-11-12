class Book < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  validates :title, :author, :description, presence: true
end
