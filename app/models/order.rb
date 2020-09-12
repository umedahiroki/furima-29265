class Order < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :item, optional: true
    has_one :shopping_address, foreign_key: :order_id, dependent: :destroy
end
