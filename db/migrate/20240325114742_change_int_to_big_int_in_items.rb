class ChangeIntToBigIntInItems < ActiveRecord::Migration[7.0]
  def change
    change_column_null :items, :condition_id, false
    change_column_null :items, :availability_id, false
    change_column_null :items, :expected_shipping_date_id, false
    change_column_null :items, :prefecture_id, false
  end
end