class Product < ApplicationRecord
  belongs_to :category

  validates :title, uniqueness: true

  mount_uploaders :images, ImageUploader
end
