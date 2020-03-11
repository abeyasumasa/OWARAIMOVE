require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

# まとめてモデルテスト
it 'ユーザー登録画面で名前を入力しなかった場合' do
  visit new_user_registration_path
  fill_in 'Name' , with: ''
  fill_in 'Email' , with: 'spectestuser01@gmail.com'
  fill_in 'Password' , with: 'password'
  fill_in 'Password_confirmation' , with: 'password'
  check 'user_entertainer'
  click_on 'Sign up'
  expect(page).to have_content '名前を入力してください'
end

it 'ユーザー登録画面でメールアドレスを入力しなかった場合' do
  visit new_user_registration_path
  fill_in 'Name' , with: 'spectestuser01'
  fill_in 'Email' , with: ''
  fill_in 'Password' , with: 'password'
  fill_in 'Password_confirmation' , with: 'password'
  check 'user_entertainer'
  click_on 'Sign up'
  expect(page).to have_content 'メールアドレスを入力してください'
  expect(page).to have_content 'メールアドレスは不正な値です'
end

it 'ユーザー登録画面でパスワードを入力しなかった場合' do
  visit new_user_registration_path
  fill_in 'Name' , with: 'spectestuser01'
  fill_in 'Email' , with: 'spectestuser01@gmail.com'
  fill_in 'Password' , with: ''
  fill_in 'Password_confirmation' , with: ''
  check 'user_entertainer'
  click_on 'Sign up'
  expect(page).to have_content 'パスワードを入力してください'
  expect(page).to have_content 'パスワードは6文字以上で入力してください'
end

it 'ユーザー登録画面でパスワードと確認パスワードが違っている場合' do
  visit new_user_registration_path
  fill_in 'Name' , with: 'spectestuser01'
  fill_in 'Email' , with: 'spectestuser01@gmail.com'
  fill_in 'Password' , with: 'password'
  fill_in 'Password_confirmation' , with: 'pass word'
  check 'user_entertainer'
  click_on 'Sign up'
  expect(page).to have_content '確認用パスワードとパスワードの入力が一致しません'
end

it 'ユーザーログインのテスト成功した場合' do
  visit new_user_session_path
  fill_in 'Email' , with: 'spectestuser02@gmail.com'
  fill_in 'Password' , with: 'password'
  click_on 'Log in'
  expect(page).to have_content 'spectestuser02'
end

it 'ユーザーログインのテスト失敗した場合' do
  visit new_user_session_path
  fill_in 'Email' , with: 'spectestuser02@gmail.com'
  fill_in 'Password' , with: 'pass word'
  click_on 'Log in'
  expect(page).to have_content 'メールアドレスまたはパスワードが違います。'
end
