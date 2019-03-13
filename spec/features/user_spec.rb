# frozen_string_literal: true

require 'rails_helper'
require 'capybara/rspec'

feature 'Admin creates a new user' do
  scenario 'with fullname, email, is_admin, team_leader_id' do
    visit new_user_path
    fill_in 'Full Name', with: 'Test'
    fill_in 'Email', with: 'email@email.com'
 
    click_button 'Submit'
    expect(page).to have_content('Test')
  end
end
