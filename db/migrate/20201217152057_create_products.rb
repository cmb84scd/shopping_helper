class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :item
      t.integer :aisle
      t.string :side

      t.timestamps
    end
  end
end
