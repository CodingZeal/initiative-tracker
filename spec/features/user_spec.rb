# frozen_string_literal: true

require 'rails_helper'
require 'capybara/rspec'

feature 'Admin creates a new user' do
  scenario 'with all attributes' do
    visit new_user_path
    fill_in 'Full Name', with: 'Test'
    fill_in 'Email', with: 'email@email.com'
    fill_in 'Is Admin', with: 'false'
    fill_in 'Team Leader', with: '2'
 
    click_button 'Submit'
    expect(page).to have_content('Test')
  end
end
