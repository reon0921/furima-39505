class CreateRecipients < ActiveRecord::Migration[7.0]
  def change
    create_table :recipients do |t|
      t.string :post_code, null: false
      t.integer :prefecture_id, null: false
      t.string :municipalities, null: false
      t.string :street_address, null: false
      t.string :telephone_number, null: false
      t.string :building_name
      t.references :purchase, null: false, foreign_key: true

      t.timestamps
    end
  end
end