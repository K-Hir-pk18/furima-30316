require 'rails_helper'
RSpec.describe 'User', type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録', type: :system do
    context 'ユーザー新規登録ができるとき' do 
      it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
        @user.valid?
      end
    end

    context 'ユーザー新規登録ができないとき' do
      it 'ニックネームがないと新規登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
    
      it 'メールアドレスがないと新規登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
    
      it 'メールアドレスに一意性がないと新規登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
    
      it 'メールアドレスに＠を含まないと新規登録できない' do
        @user.email = 'aaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
    
      it 'パスワードがないと新規登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
    
      it 'パスワードが６文字以上ないと新規登録できない' do
        @user.password = 'aaa22'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
    
      it 'パスワードが半角英数字混合でないと新規登録できない(英字のみ)' do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
    
      it 'パスワードが半角英数字混合でないと新規登録できない(数字のみ)' do
        @user.password = '5555555'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
    
      it 'パスワードが全角だと新規登録できない' do
        @user.password = '観阿弥世阿弥'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      
      it 'パスワード確認用がないと新規登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    
      it 'パスワードとパスワード確認用が一致してないと新規登録できない' do
        @user.password_confirmation = 'aaa333'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'ユーザー本名は、全角でないと登録できない(名字)' do
        @user.family_name_kanji = 'chikamatsu'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kanji is invalid")
      end

      it 'ユーザー本名は、全角でないと登録できない(名前)' do
        @user.first_name_kanji = 'mon-zaemon'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji is invalid")
      end

      it 'ユーザー本名は、全角でないと登録できない(ミョウジ)' do
        @user.family_name_kana = 'chikamatsu'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end

      it 'ユーザー本名は、全角でないと登録できない(ナマエ)' do
        @user.first_name_kana = 'mon-zaemon'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end


      it 'ユーザー本名は、名字がないと登録できない' do
        @user.family_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kanji is invalid")
      end

      it 'ユーザー本名は、名前がないと登録できない' do
        @user.first_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji is invalid")
      end

      it 'ユーザー本名は、ミョウジがないと登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end

      it 'ユーザー本名は、ナマエがないと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it '生年月日がないと登録できない' do
        @user.birth_profile = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth profile can't be blank")
      end
    end
  end

  describe 'ログイン', type: :system do
    before do
      @user = FactoryBot.create(:user)
    end
  end
end