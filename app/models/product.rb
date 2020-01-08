class Product < ApplicationRecord
  belongs_to :category

  has_rich_text :description

  validates :title, uniqueness: true

  mount_uploaders :images, ImageUploader
end
