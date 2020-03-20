# テストユーザー作成
User.create!(name: "test_user",
             email: "test_user@examp.com",
             password: "password",
             password_confirmation: "password",
             entertainer: true,
             uid: "123456789",
             provider: ""
)
# 芸人であるユーザー
15.times do |n|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  uid = User.create_unique_string
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               entertainer: true,
               icon: open("#{Rails.root}/db/fixtures/image01.jpg"),
               uid: uid,
               provider: ""
  )
end

# 芸人ではないユーザー
15.times do |n|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  uid = User.create_unique_string
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               entertainer: false,
               icon: open("#{Rails.root}/db/fixtures/image01.jpg"),
               uid: uid,
               provider: ""
  )
end

# 芸人

1.times do |n|
  name = Faker::Games::Zelda.character
  email = Faker::Internet.email
  15.times do |n|
    user_id = n + 1
    Comedian.create!(combination_name: name,
                     email: email,
                     genre: "漫才",
                     combination_icon: open("#{Rails.root}/db/fixtures/image02.jpg"),
                     comment: "test",
                     user_id: user_id,
                     twitter_url: "https://twitter",
                     youtube_url: "https://tyoutube"
    )
  end
end

# ライブ
15.times do |n|
  title = Faker::Book.title
  Live.create!(title: title,
               content: "test",
               place: "渋谷",
               date: DateTime.strptime("2020/02/29", "%Y/%m/%d"),
               start_time: Time.strptime("2020/02/29 10:00", "%Y/%m/%d %H:%M"),
               ending_time: Time.strptime("2020/02/29 12:00", "%Y/%m/%d %H:%M"),
               price: 2000
  )
end

#お気に入り
10.times do |n|
  user_id = n + 16
  comedian_id = n + 1
  Favorite.create!(user_id: user_id,
                   comedian_id: comedian_id)
end

# 参加ライブ
10.times do |n|
  user_id = n + 16
  live_id = n + 1
  ParticipantManagement.create!(user_id: user_id,
                                live_id: live_id)
end

# 出演ライブ
10.times do |n|
  comedian_id = n + 1
  live_id = n + 1
  PerformerManagement.create!(comedian_id: comedian_id,
                              live_id: live_id)
end

