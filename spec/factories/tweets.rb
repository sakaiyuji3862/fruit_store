FactoryBot.define do
  factory :tweet do
    name             {Faker::Name.name}
    text             {Faker::Lorem.sentence}
    price            {300}
    shipping_cost_id {2}
    shipping_day_id  {2}
    prefecture_id    {2}
    
    association :user
    
    after(:build) do |tweet|
      tweet.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
    
  end
end
