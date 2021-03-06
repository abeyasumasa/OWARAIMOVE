FactoryBot.define do
  factory :comedian do
    factory :first_comedian, class: Comedian do
      id { "2" }
      comment { "comedian02です！" }
      combination_name { "comedian02" }
      email { "comedian02@gmail.com" }
      genre { "漫才" }
      twitter_url { "https://comedian02.html" }
      youtube_url { "https://comedian02.html.erb" }
      user_id {"3"}
    end

    factory :second_comedian, class: Comedian do
      id { "3" }
      comment { "comedian03です！" }
      combination_name { "comedian03" }
      email { "comedian03@gmail.com" }
      genre { "漫才" }
      twitter_url { "https://comedian03.html" }
      youtube_url { "https://comedian03.html.erb" }
      # association :user, factory: :second_user
      user_id {"5"}
    end
  end
end