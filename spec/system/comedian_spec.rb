require 'rails_helper'

RSpec.describe '芸人登録機能', type: :system do
  let!(:first_user) { FactoryBot.create(:first_user) }
  let!(:second_user) { FactoryBot.create(:second_user) }
  let!(:third_user) { FactoryBot.create(:third_user) }
  let!(:fourth_user) { FactoryBot.create(:fourth_user) }
  let!(:first_comedian) { create(:first_comedian) }
  let!(:second_comedian) { create(:second_comedian) }

  it '芸人一覧表示テスト' do
    visit new_user_session_path
    fill_in 'Email', with: 'spectestuser02@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'ログイン'
    visit comedians_path
    expect(page).to have_content 'comedian02'
    expect(page).to have_content 'comedian03'
  end

  it '芸人登録テスト' do
    visit new_user_session_path
    fill_in 'Email', with: 'spectestuser05@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'ログイン'
    visit new_comedian_path
    fill_in 'Comment', with: 'comedian01です！'
    fill_in 'Combination_name', with: 'comedian01'
    fill_in 'Email', with: 'comedian01@gmail.com'
    select '漫才', from: 'comedian_genre'
    fill_in 'Twitter_url', with: 'https:www'
    fill_in 'Youtube_url', with: 'https:www'
    click_on '登録'
    click_on '登録'
    expect(page).to have_content 'comedian01'
  end

  it '芸人詳細確認テスト' do
    visit comedian_path(first_user.comedian.id)
    expect(page).to have_content 'comedian02'
  end

  it '芸人編集確認テスト' do
    visit new_user_session_path
    fill_in 'Email', with: 'spectestuser02@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'ログイン'
    visit edit_comedian_path(2)
    fill_in 'Comment', with: 'comedian04です！'
    fill_in 'Combination_name', with: 'comedian04'
    fill_in 'Email', with: 'comedian04@gmail.com'
    select 'コント', from: 'comedian_genre'
    fill_in 'Twitter_url', with: 'https:www'
    fill_in 'Youtube_url', with: 'https:www'
    click_on '登録'
    expect(page).to have_content 'comedian04'
  end

  it '芸人削除確認テスト' do
    visit new_user_session_path
    fill_in 'Email', with: 'spectestuser02@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'ログイン'
    visit comedians_path
    click_on '削除', match: :first
    expect(page).to_not have_content 'comedian04'
  end

  it '登録した芸人以外編集ができなくなっているかテスト' do
    visit new_user_session_path
    fill_in 'Email', with: 'spectestuser02@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'ログイン'
    visit edit_comedian_path(second_comedian.id)
    expect(page).to have_content '権限がありません'
  end

  it '芸人が複数登録できないようになっているかテスト' do
    visit new_user_session_path
    fill_in 'Email', with: 'spectestuser02@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'ログイン'
    visit comedians_path
    expect(page).to_not have_content '芸人プロフィール作成'
  end
end

# bundle exec rspec spec/system/comedian_spec.rb