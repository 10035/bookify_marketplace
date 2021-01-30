class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.date :order_date
      t.integer :order_total
      t.integer :quantity
      t.string :status
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
