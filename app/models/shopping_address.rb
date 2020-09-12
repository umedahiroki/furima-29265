class ShoppingAddress < ApplicationRecord
    belongs_to :order,optional: true

    extend ActiveHash::Associations::ActiveRecordExtensions
    
    belongs_to_active_hash :prefecture

end
