require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の保存' do
    context "商品が保存できる場合" do
      it "全ての項目が入力されていると商品は保存される" do
        expect(@item).to be_valid
      end
    end
    context "商品が保存できない場合" do
      it "商品名が空だと保存されない" do
        @item.name =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品説明が空だと保存されない" do
        @item.description =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "画像が空だと保存されない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "カテゴリーが空だと保存されない" do
        @item.category_id ="1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "商品の状態が空だと保存されない" do
        @item.status_id ="1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it "配送料負担の情報が空だと保存されない" do
        @item.shipping_id ="1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping must be other than 1")
      end
      it "発送元が空だと保存されない" do
        @item.prefecture_id ="1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "発送までの日数が空だと保存されない" do
        @item.scheduled_id ="1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled must be other than 1")
      end
      it "価格か空だと保存されない" do
        @item.price =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格が￥299以下だと保存されない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end
      it "価格が￥10000000以上だと保存されない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end
      it "価格が半角数字以外だと保存されない" do
        @item.price =３００００
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
