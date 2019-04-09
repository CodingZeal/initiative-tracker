# frozen_string_literal: true
require 'rails_helper'
require 'capybara/rspec'
include RequestHelpers

feature 'Team leader creates a new note' do
  let(:user){ create_logged_in_user }
  let(:member) { create(:user, email: "a@gmail.com", team_leader: user) }
  let(:initiative) { create(:initiative, user: member) }

  scenario 'clicks add note button' do
    visit user_initiative_path(member, initiative )
    expect(page).to have_button("Add Note")
    fill_in 'note_body', with: 'Note test'
    click_button 'Add Note'
    expect(page).to have_content('Note test')
  end
end

feature 'Team leader creates a new note' do
  let(:user){ create_logged_in_user }
  let(:member) { create(:user, email: "a@gmail.com", team_leader: user) }
  let(:initiative) { create(:initiative, user: member) }

  scenario 'clicks back button' do
    visit user_initiative_path(member, initiative )
    click_link 'Back'
    expect(page).to have_content("#{member.fullname}'s Initiatives")
  end
end

feature 'Team leader creates a new note' do
  let(:user){ create_logged_in_user }
  let(:member) { create(:user, email: "a@gmail.com", team_leader: user) }
  let(:initiative) { create(:initiative, user: member) }

  scenario 'clicks add note button without content' do
    visit user_initiative_path(member, initiative )
    fill_in 'note_body', with: ''
    click_button 'Add Note'
    expect(page).to have_content("Body can't be blank")
  end

  scenario 'clicks add note button less than 5 charactor' do
    visit user_initiative_path(member, initiative )
    fill_in 'note_body', with: 'test'
    click_button 'Add Note'
    expect(page).to have_content("Body is too short")
  end
end
