FactoryBot.define do
  factory :user do
    factory :first_user, class: User do
      id { "3" }
      name { "spectestuser02" }
      email { "spectestuser02@gmail.com" }
      password { "password" }
      password_confirmation { "password" }
      entertainer {"true"}      
    end

  factory :second_user, class: User do
    id { "4" }
    name { "spectestuser03" }
    email { "spectestuser03@gmail.com" }
    password { "password" }
    password_confirmation { "password" }
    entertainer {"false"}
    end
  end
end
