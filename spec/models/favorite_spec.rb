require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let!(:first_user) { create(:first_user) }
  let!(:second_user) { create(:second_user) }
  let!(:favorite) { create(:favorite, user_id: first_user.id, comedian_id: second_user.comedian.id) }
  it '重複してお気に入りが出来る場合、無効である' do
    favorite.user.id = '3'
    favorite.user.id = '3'
    expect(favorite).to_not be_valid
  end
end

# bundle exec rspec spec/models/favorite_spec.rb