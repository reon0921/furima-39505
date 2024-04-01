class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name,null: false
      t.text :description,null: false
      t.integer :price,null: false
      t.references :user, foreign_key: true,null: false
      t.integer :category_id,null: false
      t.integer :condition_id,null: false
      t.integer :availability_id,null: false
      t.integer :expected_shipping_date_id,null: false
      t.integer :prefecture_id,null: false

 t.timestamps
  end
end
end