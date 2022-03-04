class CreateAdmin < ActiveRecord::Migration[7.0]
  def change
    create_table :admins do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.integer :role, default: 0
      t.string :encrypted_password, null: false

      t.timestamps
    end
  end
end
