require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do 
    @user1 = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
    @user2 = FactoryBot.build(:user)
    @order = FactoryBot.build(:order_address, item_id: @item.id, user_id: @user2.id)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it " 全ての項目が正しく入力されていると登録できる" do
        expect(@order).to be_valid
      end
    end
    context '商品購入がうまくいかないとき' do
      it "tokenが空だと登録できない" do
        @order.token = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it "郵便番号が空だと登録できない" do
        @order.postal_code = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it "郵便番号に(-)が含まれていないと登録できない" do
        @order.postal_code = 3333333
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "prefecture_idが空だと登録できない" do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "municipalityが空だと登録できない" do
        @order.municipality = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipality can't be blank")
      end
      it "addressが空だと登録できない" do
        @order.address = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it "phone_numberが空だと登録できない" do
        @order.phone_number = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberが1２文字以上だと登録できない" do
        @order.phone_number = 2222222222222
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it "phone_numberに(-)が含まれると登録できない" do
        @order.phone_number = 222-222555
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      
    end
    
    
  end
end
