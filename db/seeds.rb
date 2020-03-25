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

15.times do |n|
  genres = ["コント", "漫才", "フリートーク", "モノマネ", "リアクション芸", "大喜利",
            "一発ギャグ", "歌ネタ/リズムネタ", "ピン芸人", "フリップ芸", "漫談"]
  genre = genres.sample
  user_id = n + 1
  name = Faker::Games::Zelda.character
  email = Faker::Internet.email
  comment = "test" + "#{n}"
  number = [*1..4].sample
  Comedian.create!(combination_name: name,
                   email: email,
                   genre: genre,
                   combination_icon: open("#{Rails.root}/db/fixtures/image0#{number}.jpg"),
                   comment: comment,
                   user_id: user_id,
                   twitter_url: "https://twitter",
                   youtube_url: "https://youtube"
  )
end

# ライブ
15.times do |n|
  title = Faker::Book.title
  s1 = Date.parse("2020/01/1")
  s2 = Date.parse("2021/01/01")
  date = Random.rand(s1..s2)
  places = ["渋谷", "原宿", "新宿", "神保町"]
  place = places.sample
  conent = "test" + "#{n}"
  Live.create!(title: title,
               content: conent,
               place: place,
               date: date,
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
15.times do |n|
  comedian_id = n + 1
  live_id = n + 1
  PerformerManagement.create!(comedian_id: comedian_id,
                              live_id: live_id)
end

