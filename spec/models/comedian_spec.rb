require 'rails_helper'

RSpec.describe Comedian, type: :model do
  let(:comedian) { FactoryBot.build(:first_comedian) }
  it 'コンビ名、メール、コメントがある場合、有効である' do
    comedian.combination_name = 'comedian001'
    comedian.email = 'comedian001@gmail.com'
    comedian.comment = 'comedian001です。よろしくお願いします。'
    comedian.save
    expect(comedian.combination_name).to eq 'comedian001'
    expect(comedian.email).to eq 'comedian001@gmail.com'
    expect(comedian.comment).to eq 'comedian001です。よろしくお願いします。'
  end

  describe '芸人モデルの' do
    context 'combination_name値が' do
      it '空白の場合、無効である' do
        comedian.combination_name = ' '
        expect(comedian).to_not be_valid
      end
      it '30文字以上の場合、無効である' do
        comedian.combination_name = 'a' * 31
        expect(comedian).to_not be_valid
      end
      it '30文字以下の場合、有効である' do
        comedian.combination_name = 'a' * 30
        expect(comedian).to be_valid
      end
    end
    context 'email値が' do
      it '空白の場合、無効である' do
        comedian.email = ' '
        expect(comedian).to_not be_valid
      end
      it '256文字以上の場合、無効である' do
        comedian.email = 'a' * 246 + "@gmail.com"
        expect(comedian).to_not be_valid
      end
      it '255文字以下の場合、有効である' do
        comedian.email = 'a' * 245 + "@gmail.com"
        expect(comedian).to be_valid
      end
      it '正規表現にマッチしてない場合、無効である' do
        comedian.email = 'a' * 20
        expect(comedian).to_not be_valid
        comedian.email = '@aaaaaaaaa'
        expect(comedian).to_not be_valid
        comedian.email = 'aaaaa.aaa@aaa'
        expect(comedian).to_not be_valid
      end
      it '大文字の場合、小文字になっていること' do
        comedian.email = 'AAAAAAAAA@gmail.com'
        comedian.save
        expect(comedian.reload.email).to eq 'aaaaaaaaa@gmail.com'
      end
    end
    context 'comment値が' do
      it '空白の場合、無効である' do
        comedian.comment = ' '
        expect(comedian).to_not be_valid
      end
      it '入力されている場合、有効である' do
        comedian.comment = 'comedian001です。よろしくお願いします。'
        expect(comedian).to be_valid
      end
    end
    context 'twitter_url値が' do
      it '正規表現にマッチしており、255文字以上の場合、無効である' do
        comedian.twitter_url = 'https://www.' + 'a' * 244
        expect(comedian).to_not be_valid
      end
      it '正規表現にマッチしており、255文字以下の場合、有効である' do
        comedian.twitter_url = 'https://www.' + 'a' * 243
        expect(comedian).to be_valid
      end
      it '正規表現にマッチしてない場合、無効である' do
        comedian.twitter_url = 'a' * 243
        expect(comedian).to_not be_valid
      end
    end
    context 'youtube_url値が' do
      it '正規表現にマッチしており、255文字以上の場合、無効である' do
        comedian.youtube_url = 'https://www.' + 'a' * 244
        expect(comedian).to_not be_valid
      end
      it '正規表現にマッチしており、255文字以下の場合、有効である' do
        comedian.youtube_url = 'https://www.' + 'a' * 243
        expect(comedian).to be_valid
      end
      it '正規表現にマッチしてない場合、無効である' do
        comedian.youtube_url = 'a' * 243
        expect(comedian).to_not be_valid
      end
    end
  end
end

# bundle exec rspec spec/models/comedian_spec.rb