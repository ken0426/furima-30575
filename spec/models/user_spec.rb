require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
      
    end

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
  end
end
