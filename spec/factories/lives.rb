FactoryBot.define do
  factory :live do
    factory :first_live, class: 'Live' do
      id {2}
      title {"ライブ2"}
      content {"漫才、コント、大喜利なんでもやります！"}
      place {"渋谷無限大ホール"}
      date { "2020/01/01" }
      start_time {"13:00"}
      ending_time {"15:00"}
      price {"1000"}
    end

    factory :second_live, class: 'Live' do
      id {3}
      title {"ライブ3"}
      content {"コントが大好きな芸人達の集まりです"}
      place {"新宿ルミネ"}
      date { "2020/03/01" }
      start_time {"19:00"}
      ending_time {"21:00"}
      price {"3000"}
    end

  end
end
