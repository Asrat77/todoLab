FactoryBot.define do
  factory :todo do
    title { Faker::Lorem.word }
    status { Faker::Lorem.word }
    date { Faker::Date.between(from: '2021-01-01', to: '2021-12-31') }
  end
end
