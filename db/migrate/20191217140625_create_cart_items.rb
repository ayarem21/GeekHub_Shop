class CreateCartItems < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_items do |t|
      t.integer  "quantity",   default: 1
      t.integer  "product_id"
      t.integer  "cart_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer  "order_id"
    end
  end
end
