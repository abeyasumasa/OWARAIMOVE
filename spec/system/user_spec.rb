require 'rails_helper'

RSpec.describe 'ユーザー登録機能', type: :system do
  let!(:first_user) { create(:first_user) }
  let!(:second_user) { create(:second_user) }
  let!(:third_user) { FactoryBot.create(:third_user) }
  let!(:first_comedian) { create(:first_comedian) }
  let!(:second_comedian) { create(:second_comedian) }
  let!(:favorite) { create(:favorite, user_id: first_user.id, comedian_id: second_comedian.id) }

  scenario 'ユーザー登録テスト' do
    visit new_user_registration_path
    fill_in 'Name', with: 'spectestuser01'
    fill_in 'Email', with: 'spectestuser01@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password_confirmation', with: 'password'
    check 'user_entertainer'
    click_button '登録'
    find("button.navbar-toggler").click
    find(".dropdown-toggle").click
    click_link 'spectestuser01'
    expect(page).to have_content 'spectestuser01'
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
    expect(page).to have_content '権限がありません'
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
      find("button.navbar-toggler").click
      find(".dropdown-toggle").click
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
    find("button.navbar-toggler").click
    find(".dropdown-toggle.user").click
    click_link 'プロフィール変更'
    fill_in 'user[name]', with: 'spectestuser07'
    fill_in 'user[email]', with: 'spectestuser07@gmail.com'
    check 'user_entertainer'
    click_button '更新'
    find("button.navbar-toggler").click
    find(".dropdown-toggle.user").click
    click_on 'spectestuser07'
    expect(page).to have_content 'spectestuser07プロフィール'
  end

end

# bundle exec rspec spec/system/user_spec.rb
