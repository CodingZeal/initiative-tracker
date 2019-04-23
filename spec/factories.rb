# frozen_string_literal: true

FactoryBot.define do
  factory :initiative do
    title 'Test'
    target_date '01/01/2020'
    completion false
  end

  factory :user do
    fullname 'Test'
    email 'email@email.com'
    password '123456'
  end

  factory :note do
    body 'Note Test'
  end

end
