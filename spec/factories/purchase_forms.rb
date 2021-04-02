FactoryBot.define do
  factory :purchase_form do
    postal_code        { '123-4567' }
    prefecture_id      { Faker::Number.within(range: 1..47) }
    municipality       { Faker::Lorem.characters(number: 10, min_alpha: 4, min_numeric: 1) }
    banch              { Faker::Lorem.characters(number: 10, min_alpha: 4, min_numeric: 1) }
    building_name      { Faker::Lorem.characters(number: 10, min_alpha: 4, min_numeric: 1) }
    telephone          { Faker::Number.leading_zero_number(digits: 11) }
    token              { 'tok_abcdef12345' }
  end
end
