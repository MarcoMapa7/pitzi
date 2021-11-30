class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :device_model
      t.string :IMEI_device
      t.integer :annual_value
      t.integer :qty_installments

      t.timestamps
    end
  end
end
