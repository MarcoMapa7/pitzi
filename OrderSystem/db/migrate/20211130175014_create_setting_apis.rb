class CreateSettingApis < ActiveRecord::Migration[6.1]
  def change
    create_table :setting_apis do |t|
      t.string :email_access
      t.string :token_access

      t.timestamps
    end
  end
end
