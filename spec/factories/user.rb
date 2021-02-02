FactoryBot.define do
  factory :user do
    nickname = ('A'..'Z').to_a.shuffle[0..10].join

    nickname { nickname }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
  end
end