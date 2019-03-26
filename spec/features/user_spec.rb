# frozen_string_literal: true
require 'rails_helper'
require 'capybara/rspec'
include RequestHelpers
feature 'Admin can see a list of users' do
  let(:admin) { create_logged_in_admin }
  scenario 'clicks user list' do
    visit root_path(admin)
    click_link 'User List'
    expect(page).to have_content('Users')
  end
end
feature 'Admin creates a new user' do
  let(:admin) { create_logged_in_admin }
  scenario 'clicks add user button' do
    visit users_path(@user, admin)
    click_link 'Add User'
    expect(page).to have_content('New User')
  end
  scenario 'with attributes for Admin' do
    visit new_user_path(admin)
    fill_in 'Full Name', with: 'Test'
    fill_in 'Email', with: 'email1@email.com'
    fill_in 'Password', with: '123456'
    check 'Is Admin'
    click_button 'Submit'
    expect(page).to have_content('Test')
    expect(page).to have_content('email1@email.com')
    expect(page).to have_content('Admin')
  end
  scenario 'with attributes for Team Member' do
    visit new_user_path(@user, admin)
    fill_in 'Full Name', with: 'Test2'
    fill_in 'Email', with: 'email2@email.com'
    fill_in 'Password', with: '123456'
    click_button 'Submit'
    expect(page).to have_content('Test2')
    expect(page).to have_content('email2@email.com')
  end
  feature 'Visitor edits a user' do
    let(:user){ create_logged_in_admin }
    background do
      @user = User.create!(:fullname => 'TestA', :email => 'testa@testa.com', :password => 'icecream')
    end
    scenario 'clicks user on list view' do
      visit edit_user_path(@user, user)
      expect(page).to have_content('Edit User')
      expect(@user.fullname).to eq('TestA')
      expect(@user.email).to eq('testa@testa.com')
      expect(@user.password).to eq('icecream')
    end
    scenario 'change user name and email' do
      visit edit_user_path(@user, user)
      fill_in 'Full Name', with: 'TestB'
      fill_in 'Email', with: 'testb@testb.com'
      fill_in 'Password', with: 'bananas'
      click_button 'Submit'
      expect(page).to have_content('TestB')
      expect(page).to_not have_content('TestA')
    end
  end
end
feature 'User can log out' do
  let(:user) { create_logged_in_user }
  scenario 'clicks logout' do
    visit root_path(user)
    click_link 'Logout'
    expect(page).to have_content('Password')
  end
end
feature 'User can\'t see a list of users' do
  let(:user) { create_logged_in_user }
  scenario 'user only see logout menu not User List' do
    visit root_path(user)
    expect(page).to_not have_content('User List')
    expect(page).to have_content('Logout')
  end
end
feature 'Only admin can see users' do
    let(:admin) { create_logged_in_admin }
  background do
    @user = User.create!(:fullname => 'TestA', :email => 'testa@testa.com', :password => 'password', :is_admin => false, :team_leader_id => nil)
  end
  scenario 'user see flash message from user url' do
    visit users_path(@user)
    expect(page).to have_content('You need to sign in or sign up before continuing')
  end
  scenario 'admin can not see flash message from user url' do
    visit users_path(admin)
    expect(page).to_not have_content('You are not an admin')
    expect(page).to have_content('email@email.com')
  end
  scenario "delete user from list view" do
    visit users_path(admin)
    expect { click_link '', :id => "delete-user-#{@user.id}" }.to change(User, :count).by(-1)
     expect(page).to_not have_content("testa@testa.com")
  end
  scenario "display flash message confirming user deletion" do
    visit users_path(admin)
    expect { click_link '', :id => "delete-user-#{@user.id}" }.to change(User, :count).by(-1)
    expect(page).to have_content('deleted')
  end
end
