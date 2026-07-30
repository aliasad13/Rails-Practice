class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :product_name
      t.integer :quantity
      t.decimal :price, precision: 10, scale: 2, null: false
      t.string :status

      t.timestamps
    end

    add_index :orders, :status
    add_index :orders, :product_name
    add_index :orders, [:customer_id, :status]
  end
end