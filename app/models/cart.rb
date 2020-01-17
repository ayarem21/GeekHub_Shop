class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items

  def sub_total
    sum = 0
    cart_items.each do |line_item|
      sum += line_item.total_price
    end
    sum
  end
end
