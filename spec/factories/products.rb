FactoryBot.define do
  factory :product do
    product_name    {Faker::Name.initials(number: 6)}
    feature         {Faker::Alphanumeric.alphanumeric(number:20)}
    price           {Faker::Number.within(range: 300..99999)}
    category_id     {Faker::Number.within(range: 1..10)}
    condition_id    {Faker::Number.within(range: 1..6)}
    send_charge_id  {Faker::Number.within(range: 1..2)}
    prefecture_id   {Faker::Number.within(range: 1..47)}
    send_span_id    {Faker::Number.within(range: 1..3)}
    
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
