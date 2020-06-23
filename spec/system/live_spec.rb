require 'rails_helper'

RSpec.describe 'ライブ投稿機能', type: :system do
  let!(:second_live) { create(:second_live) }

  before do
    create(:first_user)
    create(:first_comedian)

    visit new_user_session_path
    fill_in 'Email', with: 'spectestuser02@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'ログイン'
    visit new_live_path
    fill_in 'live_title', with: 'ライブ1'
    fill_in 'live_date', with: '2021/01/01'
    fill_in 'live_place', with: '渋谷無限大ホール'
    fill_in 'live_price', with: '2000'
    fill_in 'live_content', with: 'お笑い大好きな方々集合！'
    click_on '登録'
  end

  it 'ライブ詳細テスト' do
    visit lives_path
    click_on '詳細', match: :first
    expect(page).to have_content 'ライブ1'
  end

  it 'ライブ編集' do
    visit lives_path
    click_on '編集', match: :first
    fill_in 'live_title', with: 'ライブ2'
    fill_in 'live_place', with: '新宿ルミネ'
    fill_in 'live_price', with: '2000'
    fill_in 'live_content', with: 'お笑い大好きな方々集合！'
    click_on '登録'
    expect(page).to have_content 'ライブ2'
    expect(page).to have_content '新宿ルミネ'
  end

  it 'ライブ削除' do
    visit lives_path
    click_on '削除', match: :first
    expect(page).to_not have_content 'ライブ1'
  end

  describe '検索機能のテスト' do
    it 'ライブ日時検索ができているか' do
      visit lives_path
      fill_in 'search_date', with: '2021/01/01', match: :first
      click_on '検索する'
      expect(page).to have_content 'ライブ1'
    end

    it 'ライブ場所検索ができているか' do
      visit lives_path
      select '渋谷無限大ホール', from: 'q[place_cont]'
      click_on '検索する'
      expect(page).to have_content 'ライブ1'
    end
    it 'ライブ日時場所両方で検索できているか' do
      visit lives_path
      fill_in 'search_date', with: '2021/01/01', match: :first
      select '渋谷無限大ホール', from: 'q[place_cont]'
      click_on '検索する'
      expect(page).to have_content 'ライブ1'
    end
  end
end

# bundle exec rspec spec/system/live_spec.rb