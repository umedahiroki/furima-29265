class ItemsController < ApplicationController
before_action :move_to_index, except: [:index]

def index
  @item = Item.all.order("created_at DESC")
end

def new
  @item = Item.new 
end

def create
  @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

private
def item_params
  params.require(:item).permit(:name, :price, :text, :status_id, :delivery_fee_id, :category_id, :origin_area_id, :shopping_datum_id,:image).merge(user_id: current_user.id)
end

def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
end

end
