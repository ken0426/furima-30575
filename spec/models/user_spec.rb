require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    
    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it "必須項目を入力し、ユーザー登録ができる" do
          expect(@user).to be_valid
        end

        it "passwordが6文字以上であれば登録できる" do
          @user.password = "111aaa"
          @user.password_confirmation = "111aaa"
          expect(@user).to be_valid
        end

      end

      context '新規登録がうまくいかないとき' do
        it "ニックネームが空の時" do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it "メールアドレスが空の時" do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it "パスワードが空の時" do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it "パスワードが6文字未満の時" do
          @user.password = 'aaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
        
        it "苗字が空の時" do
          @user.fastname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Fastname can't be blank")
        end
        
        it "下の名前が空の時" do
          @user.secondname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Secondname can't be blank")
        end

        it "苗字の振り仮名がカタカナ以外の時" do
          @user.fastname_kana = 'あああああ'
          @user.valid?
          expect(@user.errors.full_messages).to include("Fastname kana is invalid. Input full-width katakana characters.")
        end

        it "下の名前の振り仮名がカタカナ以外の時" do
          @user.secondname_kana = 'あああああ'
          @user.valid?
          expect(@user.errors.full_messages).to include("Secondname kana is invalid. Input full-width katakana characters.")
        end

        it "生年月日が空の時" do
          @user.birthday = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end

        it "メールアドレスは@を含む必要がある" do
          @user.email = 111
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end
        it "パスワードは半角英数字混合である" do
          @user.password = '１１１ａａａ'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
  
        it "パスワードは確認用を含めて2回入力する" do
          @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
  
        it "苗字は、全角（漢字・ひらがな・カタカナ）で入力させる" do
          @user.fastname = '1ｱ'
          @user.valid?
          expect(@user.errors.full_messages).to include("Fastname is invalid. Input full-width characters.")
        end

        it "下の名前は、全角（漢字・ひらがな・カタカナ）で入力させる" do
          @user.secondname = '1ｱ'
          @user.valid?
          expect(@user.errors.full_messages).to include("Secondname is invalid. Input full-width characters.")
        end
  
        it "苗字のフリガナは、全角カタカナで入力させる" do
          @user.fastname_kana = '1ｱあ'
          @user.valid?
          expect(@user.errors.full_messages).to include("Fastname kana is invalid. Input full-width katakana characters.")
        end

        it "下の名前のフリガナは、全角カタカナで入力させる" do
          @user.secondname_kana = '1ｱあ'
          @user.valid?
          expect(@user.errors.full_messages).to include("Secondname kana is invalid. Input full-width katakana characters.")
        end

        it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
       end
      end
    end
  end
end













