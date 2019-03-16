# frozen_string_literal: true

require 'rails_helper'
require 'capybara/rspec'

feature 'Admin can see a list of users' do
  scenario 'clicks user list' do
    visit root_path
    click_link 'User List'
    expect(page).to have_content('Users')
  end
end

feature 'Admin can see a list of users' do
  scenario 'clicks user list' do
    visit root_path
    click_link 'User List'
    expect(page).to have_content('Users')
  end
end

feature 'Admin creates a new user' do
  scenario 'clicks add user button' do
    visit users_path
    click_link 'Add User'
    expect(page).to have_content('New User')
  end
  scenario 'with attributes for Admin' do
    visit new_user_path
    fill_in 'Full Name', with: 'Test'
    fill_in 'Email', with: 'email@email.com'
    fill_in 'Password', with: '123456'
    check 'Is Admin'
    click_button 'Submit'
    expect(page).to have_content('Test')
    expect(page).to have_content('email@email.com')
    expect(page).to have_content('Admin')
  end
  scenario 'with attributes for Team Leader' do
    visit new_user_path
    fill_in 'Full Name', with: 'Test1'
    fill_in 'Email', with: 'email1@email.com'
    fill_in 'Password', with: '123456'
    expect(page).to have_selector '#user_team_leader_id'
    click_button 'Submit'
    expect(page).to have_content('Test1')
    expect(page).to have_content('email1@email.com')
  end
  scenario 'with attributes for Team Member' do
    visit new_user_path
    fill_in 'Full Name', with: 'Test2'
    fill_in 'Email', with: 'email2@email.com'
    fill_in 'Password', with: '123456'
    click_button 'Submit'
    expect(page).to have_content('Test2')
    expect(page).to have_content('email2@email.com')
  end
end
