# frozen_string_literal: true

FactoryBot.define do
  factory :initiative do
    title 'Test'
    target_date '01/01/2020'
  end

  factory :user do
    fullname 'Test'
    email 'email@email.com'
    # password 'password'
  end
end
