FactoryBot.define do

  factory :destination do
    destination_family_name           {"山田"}
    destination_first_name            {"太郎"}
    destination_family_name_kana      {"やまだ"}
    destination_first_name_kana       {"たろう"}
    post_code                         {"1234567"}
    pref_id                           {"1"}
    city                              {"渋谷区"}
    house_number                      {"渋谷１丁目"}
    # building_name                     {"渋谷ビル101"}
    # phone_number                      {"00000000000"}
  end

end