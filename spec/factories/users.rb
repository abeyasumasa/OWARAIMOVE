FactoryBot.define do
  factory :user do
    factory :first_user, class: User do
      id { "3" }
      name { "spectestuser02" }
      email { "spectestuser02@gmail.com" }
      password { "password" }
      password_confirmation { "password" }
      entertainer { "true" }
      uid { "123456" }
    end

    factory :second_user, class: User do
      id { "4" }
      name { "spectestuser03" }
      email { "spectestuser03@gmail.com" }
      password { "password" }
      password_confirmation { "password" }
      entertainer { "false" }
      uid { "234567" }
      provider { "" }
    end

    factory :third_user, class: User do
      id { "5" }
      name { "spectestuser04" }
      email { "spectestuser04@gmail.com" }
      password { "password" }
      password_confirmation { "password" }
      entertainer { "true" }
      uid { "345678" }
      provider { "" }
    end

    factory :fourth_user, class: User do
      id { "6" }
      name { "spectestuser05" }
      email { "spectestuser05@gmail.com" }
      password { "password" }
      password_confirmation { "password" }
      entertainer { "true" }
      uid { "456789" }
      provider { "" }
    end
  end
end
