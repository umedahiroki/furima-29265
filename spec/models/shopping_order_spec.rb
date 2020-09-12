require 'rails_helper'

RSpec.describe ShoppingOrder, type: :model do

      before do
        @shopping_order = FactoryBot.build(:shopping_order)
      end

      describe '#create' do
  
      it 'post_codeが空だと登録出来ない' do
        @shopping_order.post_code = nil
        @shopping_order.valid?
        expect(@shopping_order.errors.full_messages).to include("Post code can't be blank")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @shopping_order.post_code = '1234567'
        @shopping_order.valid?
        expect(@shopping_order.errors.full_messages).to include("Post code is invalid")
      end

      it 'prefecture_idが1だと登録できない' do
        @shopping_order.prefecture_id = 1
        @shopping_order.valid?
        expect(@shopping_order.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'cityが空だと登録できない' do
        @shopping_order.city = nil
        @shopping_order.valid?
        expect(@shopping_order.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空だと保存できないこと' do
        @shopping_order.address = nil
        @shopping_order.valid?
        expect(@shopping_order.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空だと保存できないこと' do
        @shopping_order.phone_number = nil
        @shopping_order.valid?
        expect(@shopping_order.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが11桁以内でないと登録できない' do
        @shopping_order.phone_number = 111111111111
        @shopping_order.valid?
        expect(@shopping_order.errors.full_messages).to include("Phone number is invalid")
      end

      it 'tokenが空だと保存できないこと' do
        @shopping_order.token = nil
        @shopping_order.valid?
        expect(@shopping_order.errors.full_messages).to include("Token can't be blank")
      end

    end
  end


