require 'rails_helper'

RSpec.describe 'ライブ投稿機能', type: :system do
	before do
		FactoryBot.create(:first_user)
		FactoryBot.create(:first_live)
    end
    
    


#ライブ作成
#ライブ詳細テスト
#ライブ編集
#ライブ削除
#ライブ日時検索ができているか
#ライブ場所検索ができているか
#ライブ日時場所両方で検索できているか