class AddDefaultValueToQuantity < ActiveRecord::Migration[6.0]
  def change
    change_column :items, :quantity, :integer, default: 1
  end
end
