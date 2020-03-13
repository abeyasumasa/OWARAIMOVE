require 'rails_helper'

RSpec.describe '芸人登録機能', type: :system do
	let!(:first_user){FactoryBot.create(:first_user)}
	let!(:second_user){FactoryBot.create(:second_user)}
	#FactoryBot.create(:first_comedian)
	#FactoryBot.create(:second_comedian)

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
		fill_in 'Email', with: 'spectestuser02@gmail.com'
		fill_in 'Password', with: 'password'
		click_button 'ログイン'
		visit new_comedian_path
		fill_in 'Comment' , with: 'comedian01です！'
		fill_in 'Combination_name' , with: 'comedian01'
		fill_in 'Email' , with: 'comedian01@gmail.com'
        select '漫才', from: 'ジャンル'
        fill_in 'Twitter_url' , with: 'comedian01.html'
        fill_in 'Youtube_url' , with: 'comedian01.html.erb'
		click_on '登録'
		click_on '登録'
		expect(page).to have_content 'comedian02'
	end

	it '芸人詳細確認テスト' do
		visit comedian_path(2)
		expect(page).to have_content 'comedian02'
	end

	it '芸人編集確認テスト' do
		visit new_user_session_path
		fill_in 'Email', with: 'spectestuser02@gmail.com'
		fill_in 'Password', with: 'password'
		click_button 'ログイン'
		visit edit_comedian_path(2)
		fill_in 'Comment' , with: 'comedian04です！'
		fill_in 'Combination_name' , with: 'comedian04'
		fill_in 'Email' , with: 'comedian04@gmail.com'
		select 'コント', from: 'ジャンル'
        fill_in 'Twitter_url' , with: 'comedian04.html'
        fill_in 'Youtube_url' , with: 'comedian04.html.erb'
		click_on '登録'
		expect(page).to have_content 'comedian04'
	end

	it '芸人削除確認テスト' do
		visit new_user_session_path
		fill_in 'Email', with: 'spectestuser02@gmail.com'
		fill_in 'Password', with: 'password'
		click_button 'ログイン'
		visit comedians_path
		click_on '削除',match: :first
		expect(page).to_not have_content 'comedian04'
	end

	it '登録した芸人以外編集ができなくなっているかテスト' do
		visit new_user_session_path
		fill_in 'Email', with: 'spectestuser02@gmail.com'
		fill_in 'Password', with: 'password'
		click_button 'ログイン'
		visit edit_comedian_path(3)
		expect(page).to have_content '権限がありません'
	end
end

# bundle exec rspec spec/system/comedian_spec.rb