# ユーザー
# 芸人ではないユーザー
15.times do |n|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               entertainer: false,
               icon: open("#{Rails.root}/db/fixtures/image01.jpg")
               )
end

# 芸人であるユーザー
15.times do |n|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               entertainer: true,
               icon: open("#{Rails.root}/db/fixtures/image01.jpg")
               )
end

# 芸人

30.times do |n|
  name = Faker::Games::Zelda.character
  email = Faker::Internet.email
  user_id = rand(15..30)
  Comedian.create!(combination_name: name,
               email: email,
               genre: "漫才",
               combination_icon: open("#{Rails.root}/db/fixtures/image02.jpg"),
               comment: "test",
               user_id: user_id
               )
end

# ライブ
30.times do |n|
  title = Faker::Book.title
  Live.create!(title: title,
               content: "test",
               place: "渋谷",
               date: DateTime.strptime("2020/02/29","%Y/%m/%d"),
               start_time: Time.strptime("2020/02/29 10:00","%Y/%m/%d %H:%M"),
               ending_time: Time.strptime("2020/02/29 12:00","%Y/%m/%d %H:%M"),
               price: 2000
               )
end