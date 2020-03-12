require 'rails_helper'

RSpec.describe 'ユーザー登録機能', type: :system do
  let!(:first_user){ FactoryBot.create(:first_user)}
  let!(:second_user){ FactoryBot.create(:second_user)}
  let!(:first_comedian){ FactoryBot.create(:first_comedian) }
  let!(:second_comedian) { FactoryBot.create(:second_comedian) }
  let!(:favorite){FactoryBot.create( :favorite,user_id: first_user.id,comedian_id: second_comedian.id) }
  #let!(:favorite){FactoryBot.create(:favorite)}
  
  scenario 'ユーザー登録テスト' do
    visit new_user_registration_path
    fill_in 'Name' ,with: 'spectestuser01'
    fill_in 'Email' ,with: 'spectestuser01@gmail.com'
    fill_in 'Password' ,with: 'password'
    fill_in 'Password_confirmation' ,with: 'password'
    check 'user_entertainer'
    click_button '新規登録'
    expect(page).to have_content 'spectestuser01'
  end

  scenario 'ユーザーログインテスト' do
    visit new_user_session_path
    fill_in 'Email' ,with: 'spectestuser02@gmail.com'
    fill_in 'Password' ,with: 'password'
    click_button 'ログイン'
    expect(page).to have_content 'spectestuser02'
  end
    
  scenario '他人のマイページを表示しない' do
    visit new_user_session_path
    fill_in 'Email' ,with: 'spectestuser02@gmail.com'
    fill_in 'Password' ,with: 'password'
    click_button 'ログイン'
    visit user_path(4)
    expect(page).to have_content 'spectestuser02のページ'
  end

  scenario 'お気に入り芸人が表示されるかのテスト' do
    visit new_user_session_path
    fill_in 'Email' ,with: 'spectestuser02@gmail.com'
    fill_in 'Password' ,with: 'password'
    click_button 'ログイン'
    visit user_path(3)
    click_on 'フォロー'
    expect(page).to have_content 'comedian03'
  end

  scenario 'ユーザー情報編集テスト' do
    visit new_user_session_path
    fill_in 'Email' ,with: 'spectestuser02@gmail.com'
    fill_in 'Password' ,with: 'password'
    click_button 'ログイン'
    click_on 'アカウント'
    click_on 'プロフィール変更'
    fill_in 'Name' , with:'spectestuser04'
    fill_in 'Email' , with:'spectestuser04@gmail.com'
    fill_in 'Password' , with:'password'
    fill_in 'Password_confirmation' ,with: 'password'
    check 'user_entertainer'
    click_button '更新'
    fill_in 'Email' , with:'spectestuser04@gmail.com'
    fill_in 'Password' , with:'password'
    click_button  'ログイン'
    expect(page).to have_content 'spectestuser04のページ'
  end
    
end

# bundle exec rspec spec/system/user_spec.rb

# 管理画面のテスト
# E2Eテストとは、Webサイトやアプリケーションの「開始から終了まで（ユーザーがページに来てから、目的を果たし離脱するまで）」が、期待通り動いているかを確認するテスト