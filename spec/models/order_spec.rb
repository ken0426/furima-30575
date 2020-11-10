require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#create' do
    before do
      @order = FactoryBot.build(:user)
    end
    describe '商品購入機能' do
      context '商品購入ができる時' do
        it "必須項目を入力し、商品が購入できる" do
          expect(@order).to be_valid
        end
      end

        it '郵便番号にはハイフンが必要であること' do
        end

        it '電話番号にはハイフンは不要で、11桁以内であること' do
        end
    end
end
