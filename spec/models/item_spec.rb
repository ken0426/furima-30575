require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '出品機能' do
      context '出品ができる時' do

        it "必須項目を入力し、出品登録ができる" do
          expect(@item).to be_valid
        end

      end

      context '出品ができない時' do

        it "「商品画像」が選択されていない時" do
        end

        it "「商品名」が空の時" do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        
        it "「商品の説明」が空の時" do
          @item.exposition = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Exposition can't be blank")
        end

        it "「カテゴリー」が未選択の時" do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end

        it "「商品の品質」が未選択の時" do
          @item.condition_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition can't be blank")
        end

        it "「配送料の負担」が未選択の時" do
          @item.delivery_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery can't be blank")
        end

        it "「配送元の元の地域」が未選択の時" do
          @item.area_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Area can't be blank")
        end

        it "「配送までの日数」が未選択の時" do
          @item.day_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Day can't be blank")
        end

        it "「価格」が空の時" do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it "「価格」が数字以外の時" do
          @item.price = "aaa"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters.")
        end

        it "「価格」の入力が0円〜299円の場合" do
          @item.price = 50
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end

        it "「価格」の入力が9,999,999円〜以上の場合" do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end

      end
    end
  end
end
