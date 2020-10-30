FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"yone33933"}
    password_confirmation {password}
    family_name           {"山田"}
    first_name            {"太郎"}
    kana_family_name      {"ヤマダ"}
    kana_first_name       {"タロウ"}
    birthday              {"1989.1.1"}
    id                    {Faker::Number.number(digits: 1)}
  end
end