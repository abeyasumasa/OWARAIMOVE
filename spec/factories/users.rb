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
      provider { "" }
      association :comedian , factory: :first_comedian

      # after(:create) do |first_user|
      #   create(:favorite, user: first_user, comedian: create(:second_comedian))
      # end
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
      association :comedian, factory: :second_comedian
    end
  end
end
