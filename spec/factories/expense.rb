FactoryBot.define do
    factory :expense do
      name { Faker::Lorem.word }
      amount { Faker::Number.number(digits: 2) }
      date_of_expense { Faker::Date.between(from: Date.today - 1, to: Date.today) }
      category_id { 1 }
      user
    end
  end