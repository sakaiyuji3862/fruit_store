FactoryBot.define do
  factory :user do
    nickname                {"sakai"}
    email                   {Faker::Internet.free_email}
    password                {"0000aa"}
    password_confirmation   {"0000aa"}
  end
end
