FactoryBot.define do
  factory :user do
    nickname                {Faker::Name.initials(number: 2)}
    email                   {Faker::Internet.free_email}
    password                {"1a" + Faker::Internet.password(min_length: 6)}
    password_confirmation   {password}
    family_name_kanji       {"近松"}
    first_name_kanji        {"門左衛門"}
    family_name_kana        {"チカマツ"}
    first_name_kana         {"モンザエモン"}
    birth_profile           {Faker::Date.between(from: '1930-01-01', to: '2016-12-31')}
  end
end
