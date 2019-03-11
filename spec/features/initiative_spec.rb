# frozen_string_literal: true

require 'rails_helper'
require 'capybara/rspec'

feature 'Visitor creates a new initiative' do
  scenario 'with title target date and description' do
    visit new_initiative_path
    fill_in 'Initiative Name', with: 'TestJ'
    fill_in 'Target Date', with: '01/01/2020'
    fill_in 'Description', with: 'TestJ'
    click_button 'Submit'
    expect(page).to have_content('TestJ')
  end
end
