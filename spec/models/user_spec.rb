require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user){FactoryBot.build(:first_user)}
  it '名前、メールアドレス、パスワードがある場合、有効である' do
    user.name = 'testuser001'
    user.email = 'testuser001@gmail.com'
    user.password = 'password'
    user.password_confirmation = 'password'
    user.save
    expect(user.name).to eq 'testuser001'
    expect(user.email).to eq 'testuser001@gmail.com'
  end

  describe 'ユーザーモデルの' do
    context 'name値が' do
      it '空白の場合、無効である' do
        user.name = ' '
        expect(user).to_not be_valid
      end
      it '31文字以上の場合、無効である' do
        user.name = 'a' * 31
        expect(user).to_not be_valid
      end
      it '30文字以下の場合、有効である' do
        user.name = 'a' * 30
        expect(user).to be_valid
      end
    end
    context 'email値が' do
      it '空白の場合、無効である' do
        user.email = ' '
        expect(user).to_not be_valid
      end
      it '256文字以上の場合、無効である' do
        user.email = 'a' * 246 + "@gmail.com"
        expect(user).to_not be_valid
      end
      it '255文字以下の場合、有効である' do
        user.email = 'a' * 245 + "@gmail.com"
        expect(user).to be_valid
      end
      it '正規表現にマッチしてない場合、無効である' do
        user.email = 'a' *20
        expect(user).to_not be_valid
        user.email = '@aaaaaaaaa'
        expect(user).to_not be_valid
        user.email = 'aaaaa.aaa@aaa'
        expect(user).to_not be_valid
      end
      it '大文字の場合、小文字になっていること' do
        user.email = 'AAAAAAAAA@gmail.com'
        user.save
        expect(user.reload.email).to eq 'aaaaaaaaa@gmail.com'
      end
    end
    context 'password値が' do
      it '空白の場合、無効である' do
        user.password = ' '
        user.password_confirmation = ' '
        expect(user).to_not be_valid
      end
      it '6文字以下の場合、無効である' do
        user.password = 'a' * 5
        user.password_confirmation = 'a' * 5
        expect(user).to_not be_valid
      end
      it '6文字以上の場合、有効である' do
        user.password = 'a' * 6
        user.password_confirmation = 'a' * 6
        expect(user).to be_valid
      end
      it 'パスワードとパスワード確認が一致しない場合、無効である' do
        user.password = 'a' * 6
        user.password_confirmation = 'a' * 7
        expect(user).to_not be_valid
      end
    end
  end
end

# bundle exec rspec spec/models/user_spec.rb