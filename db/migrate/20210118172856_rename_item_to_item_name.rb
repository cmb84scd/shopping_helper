class RenameItemToItemName < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :item, :item_name
  end
end
