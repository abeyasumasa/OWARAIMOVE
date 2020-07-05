# テストユーザー作成
User.create!(name: "test_user",
             email: "test_user@examp.com",
             password: "password",
             password_confirmation: "password",
             entertainer: true,
             uid: "123456789",
             provider: ""
)
# ユーザー
User.create!(name: "亀尾　広光",
              email: Faker::Internet.email,
              password: "password",
              password_confirmation: "password",
              entertainer: true,
              icon: "",
              uid: User.create_unique_string,
              provider: ""
)
  User.create!(name: "中川　礼二",
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: "password",
    entertainer: true,
    icon: "",
    uid: User.create_unique_string,
    provider: ""
)
User.create!(name: "岡田　圭佑",
  email: Faker::Internet.email,
  password: "password",
  password_confirmation: "password",
  entertainer: true,
  icon: "",
  uid: User.create_unique_string,
  provider: ""
)
User.create!(name: "後藤　輝基",
  email: Faker::Internet.email,
  password: "password",
  password_confirmation: "password",
  entertainer: true,
  icon: "",
  uid: User.create_unique_string,
  provider: ""
)
User.create!(name: "小林　友治",
  email: Faker::Internet.email,
  password: "password",
  password_confirmation: "password",
  entertainer: true,
  icon: "",
  uid: User.create_unique_string,
  provider: ""
)
User.create!(name: "瀧川 広志",
  email: Faker::Internet.email,
  password: "password",
  password_confirmation: "password",
  entertainer: true,
  icon: "",
  uid: User.create_unique_string,
  provider: ""
)
User.create!(name: "出川　哲郎",
  email: Faker::Internet.email,
  password: "password",
  password_confirmation: "password",
  entertainer: true,
  icon: "",
  uid: User.create_unique_string,
  provider: ""
)
User.create!(name: "升野　英知",
  email: Faker::Internet.email,
  password: "password",
  password_confirmation: "password",
  entertainer: true,
  icon: "",
  uid: User.create_unique_string,
  provider: ""
)
User.create!(name: "佐久間　一行",
  email: Faker::Internet.email,
  password: "password",
  password_confirmation: "password",
  entertainer: true,
  icon: "",
  uid: User.create_unique_string,
  provider: ""
)
User.create!(name: "藤原　時",
  email: Faker::Internet.email,
  password: "password",
  password_confirmation: "password",
  entertainer: true,
  icon: "",
  uid: User.create_unique_string,
  provider: ""
)
# end

# 芸人ではないユーザー
# 15.times do |n|
#   name = Faker::Games::Pokemon.name
#   email = Faker::Internet.email
#   password = "password"
#   uid = User.create_unique_string
#   User.create!(name: name,
#                email: email,
#                password: password,
#                password_confirmation: password,
#                entertainer: false,
#                icon: open("#{Rails.root}/db/fixtures/image01.jpg"),
#                uid: uid,
#                provider: ""
#   )
# end

# 芸人
  comment = "test"
  Comedian.create!(combination_name: "インテリアモール",
    email: Faker::Internet.email,
    genre: "漫才",
    comment: comment,
    user_id: "1",
    twitter_url: "",
    youtube_url: ""
)
  Comedian.create!(combination_name: "そいそ〜す",
                   email: Faker::Internet.email,
                   genre: "コント",
                   combination_icon: open("#{Rails.root}/db/fixtures/そいそ〜す.jpg"),
                   comment: comment,
                   user_id: "2",
                   twitter_url: "https://twitter.com/soysauce_kameo",
                   youtube_url: "https://www.youtube.com/channel/UUTOSwxVNtT5RVejAH4JgxVg"
  )
  Comedian.create!(combination_name: "中川家",
    email: Faker::Internet.email,
    genre: "漫才",
    combination_icon: open("#{Rails.root}/db/fixtures/中川家.jpg"),
    comment: comment,
    user_id: "3",
    twitter_url: "https://twitter.com/nakagawake419",
    youtube_url: "https://www.youtube.com/channel/UUOg6P-Ne5Hdd5tDtcOHDd-Q"
)
Comedian.create!(combination_name: "ますだおかだ",
  email: Faker::Internet.email,
  genre: "漫才",
  combination_icon: open("#{Rails.root}/db/fixtures/ますだおかだ.jpg"),
  comment: comment,
  user_id: "4",
  twitter_url: "",
  youtube_url: ""
)
Comedian.create!(combination_name: "フットボールアワー",
  email: Faker::Internet.email,
  genre: "漫才",
  combination_icon: open("#{Rails.root}/db/fixtures/フットボールアワー.jpg"),
  comment: comment,
  user_id: "5",
  twitter_url: "",
  youtube_url: ""
)
Comedian.create!(combination_name: "ケンドーコバヤシ",
  email: Faker::Internet.email,
  genre: "フリートーク",
  combination_icon: open("#{Rails.root}/db/fixtures/ケンドーコバヤシ.jpg"),
  comment: comment,
  user_id: "6",
  twitter_url: "",
  youtube_url: ""
)
Comedian.create!(combination_name: "コロッケ",
  email: Faker::Internet.email,
  genre: "モノマネ",
  combination_icon: open("#{Rails.root}/db/fixtures/コロッケ.jpg"),
  comment: comment,
  user_id: "7",
  twitter_url: "https://twitter.com/korokkeofficial",
  youtube_url: ""
)
Comedian.create!(combination_name: "出川哲郎",
  email: Faker::Internet.email,
  genre: "リアクション芸",
  combination_icon: open("#{Rails.root}/db/fixtures/出川哲郎.jpg"),
  comment: comment,
  user_id: "8",
  twitter_url: "",
  youtube_url: ""
)
Comedian.create!(combination_name: "バカリズム",
  email: Faker::Internet.email,
  genre: "大喜利",
  combination_icon: open("#{Rails.root}/db/fixtures/バカリズム.jpg"),
  comment: comment,
  user_id: "9",
  twitter_url: "https://twitter.com/BAKARHYTHM",
  youtube_url: "https://www.youtube.com/channel/UUzOHCa6-FxSeO4wWUL6smLw"
)
Comedian.create!(combination_name: "佐久間一行",
  email: Faker::Internet.email,
  genre: "一発ギャグ",
  combination_icon: open("#{Rails.root}/db/fixtures/佐久間一行.jpg"),
  comment: comment,
  user_id: "10",
  twitter_url: "https://twitter.com/sakuzari",
  youtube_url: "https://www.youtube.com/channel/UUcJySXLBICOd1NlBktE5kOA"
)
Comedian.create!(combination_name: "藤崎マーケット",
  email: Faker::Internet.email,
  genre: "歌ネタ/リズムネタ",
  combination_icon: open("#{Rails.root}/db/fixtures/藤崎マーケット.jpg"),
  comment: comment,
  user_id: "11",
  twitter_url: "https://twitter.com/fujisakitoki",
  youtube_url: "https://www.youtube.com/channel/UUcJySXLBICOd1NlBktE5kOA"
)
# end

# ライブ
10.times do |n|
  title = Faker::Book.title
  s1 = Date.parse("2021/01/1")
  s2 = Date.parse("2022/01/01")
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
9.times do |n|
  user_id = "1"
  comedian_id = n + 2
  Favorite.create!(user_id: user_id,
                   comedian_id: comedian_id)
end

# 参加ライブ
9.times do |n|
  user_id = "1"
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

