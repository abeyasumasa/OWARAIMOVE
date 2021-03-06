require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let!(:first_user) { create(:first_user) }
  let!(:second_user) { create(:second_user) }
  let!(:third_user) { create(:third_user) }
  let!(:first_comedian) { create(:first_comedian) }
  let!(:second_comedian) { create(:second_comedian) }
  let!(:favorite) { create(:favorite, user_id: first_user.id, comedian_id: second_comedian.id) }
  let(:favorite2) { FactoryBot.build(:favorite, user_id: first_user.id, comedian_id: second_comedian.id) }
  it '重複してお気に入りが出来る場合、無効である' do
    expect(favorite2).to_not be_valid
  end
end

# bundle exec rspec spec/models/favorite_spec.rb