require 'rails_helper'

RSpec.describe Live, type: :model do
  let(:live) { FactoryBot.build(:first_live) }
  #it 'タイトル、コメント、場所、日にち、料金が入っていれば、有効である'
  describe 'ライブモデルの' do
    context 'title値が' do
      it '空白の場合、無効である' do
        live.title = ' '
        expect(live).to_not be_valid
      end
      it '255文字以上の場合、無効である' do
        live.title = 'a' * 256
        expect(live).to_not be_valid
      end
      it '255文字以下の場合、有効である' do
        live.title = 'a' * 255
        expect(live).to be_valid
      end
    end
    context 'content値が' do
      it '空白の場合、無効である' do
        live.content = ' '
        expect(live).to_not be_valid
      end
      it '入力されているの場合、有効である' do
        live.content = 'live001です。楽しいです。'
        expect(live).to be_valid
      end
    end
    context 'place値が' do
      it '空白の場合、無効である' do
        live.place = ' '
        expect(live).to_not be_valid
      end
      it '255文字以上の場合、無効である' do
        live.place = 'a' * 256
        expect(live).to_not be_valid
      end
      it '255文字以下の場合、有効である' do
        live.place = '渋谷'
        expect(live).to be_valid
      end
    end
    context 'date値が' do
      it '空白の場合、無効である' do
        live.date = ' '
        expect(live).to_not be_valid
      end
      it '入力されているの場合、有効である' do
        live.date = '2020/01/01'
        expect(live).to be_valid
      end
    end
    context 'price値が' do
      it '空白の場合、無効である' do
        live.price = ' '
        expect(live).to_not be_valid
      end
      it '数字以外の場合、無効である' do
        live.price = 'aaaa'
        expect(live).to_not be_valid
      end
      it '1より小さい場合、無効である' do
        live.price = '0'
        expect(live).to_not be_valid
      end
      it '10000より大きい場合、無効である' do
        live.price = '10001'
        expect(live).to_not be_valid
      end
      it '数字かつ1~10000の場合、有効である' do
        live.price = 5000
        expect(live).to be_valid
      end
    end
    context 'start_time値とending_time値が' do
      it '開始時間が終了時間よりも前の場合、有効である' do
        live.start_time = "15:00"
        live.ending_time = "13:00"
        expect(live).to_not be_valid
      end
      it '開始時間が終了時間よりも前の場合、有効である' do
        live.start_time = "13:00"
        live.ending_time = "15:00"
        expect(live).to be_valid
      end
    end
  end
end

# bundle exec rspec spec/models/live_spec.rb