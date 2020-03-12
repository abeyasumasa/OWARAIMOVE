require 'rails_helper'

RSpec.describe 'ライブ投稿機能', type: :system do
	let!(:first_live){FactoryBot.create(:first_live)}
	let!(:second_live){FactoryBot.create(:second_live)}
  
  it 'ライブ作成' do
  end
#ライブ詳細テスト
#ライブ編集
#ライブ削除
#ライブ日時検索ができているか
#ライブ場所検索ができているか
#ライブ日時場所両方で検索できているか
end
#bundle exec rspec spec/system/live_spec.rb