require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end


  context 'ユーザー新規登録ができるとき' do 
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      visit root_path
      expect(page).to have_content('新規登録')
      visit new_user_registration_path
      fill_in 'Nickname', with: @user.nickname
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      fill_in 'Password_confirmation', with: @user.password_confirmation
      fill_in 'family_name_kanji', with: @user.family_name_kanji
      fill_in 'first_name_kanji', with: @user.first_name_kanji
      fill_in 'family_name_kana', with: @user.family_name_kana
      fill_in 'first_name_kana', with: @user.first_name_kana
      fill_in 'birth_profile', with: @user.birth_profile

      expect{find('input[name="commit"]').click}.to change { User.count }.by(1)
      expect(current_path).to eq root_path

      expect(find(".user_nav").find("span").hover).to have_content('ログアウト')
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end

  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      visit root_path
      expect(page).to have_content('新規登録')
      visit new_user_registration_path
      fill_in 'Nickname', with: ""
      fill_in 'Email', with: ""
      fill_in 'Password', with: ""
      fill_in 'Password confirmation', with: ""
      fill_in 'family_name_kanji', with: ""
      fill_in 'first_name_kanji', with: ""
      fill_in 'family_name_kana', with: ""
      fill_in 'first_name_kana', with: ""
      fill_in 'birth_profile', with: ""
      expect{find('input[name="commit"]').click}.to change { User.count }.by(0)
      expect(current_path).to eq "/users"
    end
  end
end

RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  context 'ログインができるとき' do
    it '保存されているユーザーの情報と合致すればログインができる' do
      visit root_path
      expect(page).to have_content('ログイン')
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      expect(find(".user_nav").find("span").hover).to have_content('ログアウト')
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end

  context 'ログインができないとき' do
    it '保存されているユーザーの情報と合致しないとログインができない' do
      visit root_path
      expect(page).to have_content('ログイン')
      visit new_user_session_path
      fill_in 'Email', with: ""
      fill_in 'Password', with: ""
      find('input[name="commit"]').click
      expect(current_path).to eq new_user_session_path
    end
  end
end