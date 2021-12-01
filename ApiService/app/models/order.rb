class Order < ApplicationRecord
  validates :annual_value, :IMEI_device, :device_model, presence: true
  belongs_to :client_id, class_name: 'Client', foreign_key: 'user_id'
end
