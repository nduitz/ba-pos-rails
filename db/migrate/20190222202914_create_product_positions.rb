class CreateProductPositions < ActiveRecord::Migration[5.2]
  def change
    create_table :product_positions do |t|
      t.references :product
      t.references :basket
      t.integer :amount
    end
  end
end
