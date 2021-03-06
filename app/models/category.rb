class Category < ApplicationRecord
  has_many :category_products
  has_many :products, through: :category_products

  validates :title, uniqueness: true

  mount_uploader :image, ImageUploader
end
