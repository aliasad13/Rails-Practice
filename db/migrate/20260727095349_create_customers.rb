class CreateCustomers < ActiveRecord::Migration[8.0]
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.string :email
      t.string :phone
      t.string :city
      t.boolean :vip, null: false, default: true

      t.timestamps
    end

    add_index :customers, :name
    add_index :customers, :phone, unique: true
    add_index :customers, :city
    add_index :customers, :vip
  end
end
