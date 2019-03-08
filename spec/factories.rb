FactoryBot.define do
    factory :user do
      sequence(:email) { |n| "person#{n}@example.com" }
      password '12345678'
      name 'Robert'
    end
    factory :initiative do
        title 'Test'
        target_date '01/01/2020'
    end
end