class CreateAuthorizationKey < ActiveRecord::Migration[7.0]
  def change
    create_table :authorization_keys do |t|
      t.text :token, null: false
      t.datetime :expiry
      t.integer :authable_id, null: false
      t.string :authable_type, null: false

      t.timestamps
    end
  end
end
