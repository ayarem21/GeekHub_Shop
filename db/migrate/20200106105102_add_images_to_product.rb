class AddImagesToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :images, :string, array: true, default: []
  end
end
