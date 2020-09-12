class ShoppingOrder
    include ActiveModel::Model
    attr_accessor :post_code, :prefecture_id, :city, :address, :building_number, :phone_number,:token, :user_id, :item_id,:order_id
  
    def save
        order = Order.create(user_id: user_id, item_id: item_id)
        shopping_address = ShoppingAddress.create!(post_code: post_code, prefecture_id: prefecture_id, city: city,address: address,building_number: building_number,phone_number: phone_number,order_id: order.id)
    end

    
##各モデルのバリデーションを記載する
    with_options presence: true do 
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id , numericality: { other_than: 1 }
    validates :city
    validates :address  
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    validates :token
    end

end