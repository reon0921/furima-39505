class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.references :user, foreign_key: true
      t.integer :category_id
      t.integer :condition_id
      t.integer :availability_id
      t.integer :expected_shipping_date_id
      t.integer :prefecture_id
      t.integer :condition_id, null: false
      t.integer :availability_id, null: false
      t.integer :expected_shipping_date_id, null: false
      t.integer :prefecture_id, null: false

 t.timestamps
    end
  end
end
