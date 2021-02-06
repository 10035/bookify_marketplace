class AddDateToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :start_date, :date
    add_column :orders, :end_date, :date
    remove_column :orders, :order_date
  end
end
