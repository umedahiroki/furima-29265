require 'rails_helper'
require 'faker'

RSpec.describe Item, type: :model do
 
before do
  @item = FactoryBot.build(:item)
end

describe '#create' do

it "nameが空だと登録できない" do
  @item.name = nil
  @item.valid?
  expect(@item.errors.full_messages).to include("Name can't be blank")
end

it "pictureが空だと登録できない" do
  @item.picture = nil
  @item.valid?
  expect(@item.errors.full_messages).to include("Picture can't be blank")
end

it "textが空だと登録できない" do
  @item.text = nil
  @item.valid?
  expect(@item.errors.full_messages).to include("Text can't be blank")
end

it "status_idが1だと登録できない" do
  @item.status_id = 1
  @item.valid?
  expect(@item.errors.full_messages).to include("Status must be other than 1")
end

it "delivery_fee_idが1だと登録できない" do
  @item.delivery_fee_id = 1
  @item.valid?
  expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
end

it "category_idが1だと登録できない" do
  @item.category_id = 1
  @item.valid?
  expect(@item.errors.full_messages).to include("Category must be other than 1")
end

it "origin_area_idが1だと登録できない" do
  @item.origin_area_id = 1
  @item.valid?
  expect(@item.errors.full_messages).to include("Origin area must be other than 1")
end

it "shopping_datum_idが1だと登録できない" do
  @item.shopping_datum_id = 1
  @item.valid?
  expect(@item.errors.full_messages).to include("Shopping datum must be other than 1")
end

it "priceが空だと登録できない" do
  @item.price = nil
  @item.valid?
  expect(@item.errors.full_messages).to include("Price can't be blank")
end

end
end
