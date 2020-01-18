class Product < ApplicationRecord
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :cart_items, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_rich_text :description

  validates :title, uniqueness: true

  mount_uploaders :images, ImageUploader

  scope :order_by_price_min, -> { order price: :asc }
  scope :order_by_price_max, -> { order price: :desc }
  scope :order_by_new, -> { order created_at: :desc }
end
