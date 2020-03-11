FactoryBot.define do
  factory :comedian do
    factory :first_comedian, class: Comedian do
      id { "2" }
      comment { "comedian02です！"}
      combination_name { "comedian02" }
      email { "comedian02@gmail.com" }
      genre { "漫才" }
      twitter_url { "comedian02.html" }
      youtube_url { "comedian02.html.erb" }
      #association :user , factory: :first_user
    end

    factory :second_comedian, class: Comedian do
      id { "3" }
      comment { "comedian03です！"}
      combination_name { "comedian03" }
      email { "comedian03@gmail.com" }
      genre { "漫才" }
      twitter_url { "comedian03.html" }
      youtube_url { "comedian03.html.erb" }
      user_id { "4" }
    end
  end
end