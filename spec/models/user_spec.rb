require 'rails_helper'
require 'faker'

RSpec.describe User, type: :model do
    
      before do
        @user = FactoryBot.build(:user)
      end

      describe '#create' do

      it "nicknmameが空だと登録できない" do
        @user.nicknmame = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nicknmame can't be blank")
      end
  
      it "emailが空では登録できないこと" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "emailに＠がないと登録できないこと" do
        @user.email = "aaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
  
      it "passwordが空では登録できないこと" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
  
      it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
  
      it "passwordが6文字以上であれば登録できること" do
        @user.password  = "aaa111"
        @user.password_confirmation = "aaa111"
        expect(@user).to be_valid
      end
  
      it "passwordが5文字以下であれば登録できないこと" do
        @user.password = "aa345"
        @user.password_confirmation = "aa345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが半角英数字混合でないと登録できないこと" do
        @user.password = "AAAAAA"
        @user.password_confirmation = "AAAAAA"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
  
      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "first_name_kanjiが空では登録できないこと" do
        @user.first_name_kanji = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji can't be blank")
      end

      it "last_name_kanjiが空では登録できないこと" do
        @user.last_name_kanji = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kanji can't be blank")
      end

      it "first_name_kanjiが漢字,カタカナ,ひらがなでないと登録できないこと" do
        @user.first_name_kanji = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji is invalid")
      end

      it "last_name_kanjiが漢字,カタカナ,ひらがなでないと登録できないこと" do
        @user.last_name_kanji = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kanji is invalid")
      end

      it "first_name_katakanaが空では登録できないこと" do
        @user.first_name_katakana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana can't be blank")
      end


      it "last_name_katakanaが空では登録できないこと" do
        @user.last_name_katakana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana can't be blank")
      end

      it "first_name_katakanaがカタカナでないと登録できないこと" do
        @user.first_name_katakana = "katakana"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana is invalid")
      end

      it "last_name_katakanaがカタカナでないと登録できないこと" do
        @user.last_name_katakana = "katakana"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana is invalid")
      end

      it "birthdayが空では登録できないこと" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
