FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gma.com"}
    password              {"0000000"}
    password_confirmation {"0000000"}
    family_name           {"山田"}
    first_name            {"太郎"}
    family_name_kana      {"やまだ"}
    first_name_kana       {"たろう"}
    birth_date            {"2000-11-11"}
  end

end