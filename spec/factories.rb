# frozen_string_literal: true

FactoryBot.define do
  factory :initiative do
    title 'Test'
    target_date '01/01/2020'
    completion false
  end
end
