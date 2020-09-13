class OrdersController < ApplicationController
    before_action :move_to_index
    before_action :correct_user
    before_action :sold_out


    def index
       @item = Item.find(params[:item_id])
       @order = ShoppingOrder.new
       @shopping_address = ShoppingOrder.new
       @shopping = ShoppingAddress.new
    end
  
    def create
       @item = Item.find(params[:item_id])
       @order = ShoppingOrder.new(order_params)
         if @order.valid?
            pay_item
            @order.save
            return redirect_to root_path
         else
            render :index
         end
    end

    private
    def move_to_index
        unless user_signed_in?
          redirect_to new_user_session_path
        end
    end

    def correct_user
        @item = Item.find(params[:item_id])
          if current_user.id == @item.user_id
            redirect_to root_path
          end
    end

    def sold_out
        @item = Item.find(params[:item_id])
        if  Order.exists?(item_id: @item.id)
            redirect_to root_path
        end
    end

    def order_params
    params.permit(:post_code, :prefecture_id, :city, :address, :building_number, :phone_number,:token).merge(user_id: current_user.id, item_id: params[:item_id])
    end

    #javascriptを実行する
    def pay_item
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        Payjp::Charge.create(
          amount: @item.price,
          card: order_params[:token],   
          currency:'jpy'                
        )
    end
end