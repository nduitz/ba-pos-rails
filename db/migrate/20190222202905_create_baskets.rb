class CreateBaskets < ActiveRecord::Migration[5.2]
  def change
    create_table :baskets do |t|
      t.string :name
      t.integer :sum, default: 0
      t.integer :state, default: 0
    end
  end
end
