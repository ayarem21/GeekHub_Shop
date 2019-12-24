class Category < ApplicationRecord
  has_many :products

  validates :title, uniqueness: true

  mount_uploader :image, ImageUploader
end
