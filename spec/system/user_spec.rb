require 'rails_helper'

RSpec.describe 'ユーザー登録機能', type: :system do
  let!(:first_user) { create(:first_user) }
  let!(:second_user) { create(:second_user) }
  let!(:favorite) { create(:favorite, user_id: first_user.id, comedian_id: second_user.comedian.id) }

  scenario 'ユーザー登録テスト' do
    visit new_user_registration_path
    fill_in 'Name', with: 'spectestuser01'
    fill_in 'Email', with: 'spectestuser01@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password_confirmation', with: 'password'
    check 'user_entertainer'
    click_button '登録'
    click_link 'アカウント'
    click_link 'spectestuser01'
    expect(page).to_not have_content 'spectestuser01'
  end

  scenario 'ユーザーログインテスト' do
    visit new_user_session_path
    fill_in 'Email', with: 'spectestuser02@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'ログイン'
    expect(page).to have_content 'spectestuser02'
  end

  scenario '他人のマイページを表示しない' do
    visit new_user_session_path
    fill_in 'Email', with: 'spectestuser02@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'ログイン'
    visit user_path(second_user)
    expect(page).to have_content 'spectestuser02のページ'
  end

  describe 'お気に入り芸人が' do
    scenario '表示されるかのテスト' do
      visit new_user_session_path
      fill_in 'Email', with: 'spectestuser02@gmail.com'
      fill_in 'Password', with: 'password'
      click_button 'ログイン'
      visit user_path(first_user)
      click_on 'フォロー'
      expect(page).to have_content 'comedian03'
    end
    scenario '重複されないかのテスト' do
      visit new_user_session_path
      fill_in 'Email', with: 'spectestuser02@gmail.com'
      fill_in 'Password', with: 'password'
      click_button 'ログイン'
      visit user_path(first_user)
      click_link '芸人'
      click_link '芸人一覧'
      page.all(".comedian_show")[1].click_link("詳細")
      expect(page).to have_content 'comedian03'
      expect(page).to have_content 'お気に入り解除する'
    end
  end


  scenario 'ユーザー情報編集テスト' do
    visit new_user_session_path
    fill_in 'Email', with: 'spectestuser02@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'ログイン'
    click_on 'アカウント'
    click_on 'プロフィール変更'
    fill_in 'Name', with: 'spectestuser04'
    fill_in 'Email', with: 'spectestuser04@gmail.com'
    check 'user_entertainer'
    click_button '更新'
    expect(page).to have_content 'spectestuser04のページ'
  end

end

# bundle exec rspec spec/system/user_spec.rb