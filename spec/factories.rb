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
<<<<<<< HEAD
    password '123456'
=======
>>>>>>> Finished integrated testing, deleted show.html.erb and resolved jason's comments
  end
end
