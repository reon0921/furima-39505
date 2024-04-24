class Purchase < ApplicationRecord
  has_one :recipient
 belongs_to :user
belongs_to :item
end