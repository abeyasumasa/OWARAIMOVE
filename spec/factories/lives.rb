FactoryBot.define do
  factory :live do
    factory :first_live, class: 'Live' do
      id {2}
      title {"ライブ１"}
      content {"漫才、コント、大喜利なんでもやります！"}
      place {"渋谷無限大ホール"}
      date { "2020/01/01" }
      start_time {"13:00"}
      ending_time {"15:00"}
      price {"1000"}
    end
  end
end
