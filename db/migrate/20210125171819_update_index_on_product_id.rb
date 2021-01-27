class UpdateIndexOnProductId < ActiveRecord::Migration[6.0]
  def change
    remove_index :items, :product_id
    add_index :items, :product_id, unique: true
  end
end
