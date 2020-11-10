require 'rails_helper'

RSpec.describe ItemForm, type: :model do
  describe '#create' do
    before do
      seller_user = FactoryBot.create(:user)
      another_user = FactoryBot.create(:user)
      item = FactoryBot.create(:item, user_id: seller_user.id)
      @order = FactoryBot.build(:item_form, item_id: item.id, user_id: another_user.id)
      sleep(1)
    end

    describe '商品購入機能' do
      context '商品購入ができる時' do
        it "必須項目を入力し、商品が購入できる" do
          expect(@order).to be_valid
        end
      end

      context '商品購入ができない時' do
          it "郵便番号が空の時" do
            @order.postalcode = nil
            @order.valid?
            expect(@order.errors.full_messages).to include("Postalcode can't be blank")
          end

          it "都道府県が未選択の時" do
            @order.area_id = 1
            @order.valid?
            expect(@order.errors.full_messages).to include("Area must be other than 1")
          end

          it "市区町村が空の時" do
            @order.municipality = nil
            @order.valid?
            expect(@order.errors.full_messages).to include("Municipality can't be blank")
          end

          it "番地が空の時" do
            @order.address = nil
            @order.valid?
            expect(@order.errors.full_messages).to include("Address can't be blank")
          end

          it "電話番号が空の時" do
            @order.phone = nil
            @order.valid?
            expect(@order.errors.full_messages).to include("Phone can't be blank")
          end

          it '郵便番号にはハイフンがない時' do
            @order.postalcode = "1111111"
            @order.valid?
            expect(@order.errors.full_messages).to include("Postalcode is invalid. Input half-width characters.")
          end

          it '郵便番号が数字以外の時' do
            @order.postalcode = "ああああ"
            @order.valid?
            expect(@order.errors.full_messages).to include("Postalcode is invalid. Input half-width characters.")
          end

          it '電話番号にはハイフンもなく、11桁以内でないとき' do
            @order.phone = "090-00-00"
            @order.valid?
            expect(@order.errors.full_messages).to include("Phone is invalid. Input half-width characters.")
          end

          it '電話番号が数字以外の時' do
            @order.phone = "あああ"
            @order.valid?
            expect(@order.errors.full_messages).to include("Phone is invalid. Input half-width characters.")
          end

          it "tokenが空では登録できないこと" do
            @order.token = nil
            @order.valid?
            expect(@order.errors.full_messages).to include("Token can't be blank")
          end
       end
     end
  end
end