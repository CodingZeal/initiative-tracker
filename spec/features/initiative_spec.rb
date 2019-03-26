# frozen_string_literal: true
require 'rails_helper'
require 'capybara/rspec'
include RequestHelpers
feature 'Visitor creates a new initiative' do
  let(:user){ create_logged_in_user }
  scenario 'clicks new initiative button' do
    visit root_path(user)
    expect(page).to have_content('New Initiative')
    click_link 'New Initiative'
    fill_in 'Initiative Name', with: 'TestJ'
    fill_in 'Target Date', with: '01/01/2020'
    fill_in 'Description', with: 'TestJ'
    click_button 'Submit'
    expect(page).to have_content('TestJ')
  end
end
feature 'Visitor edits a initiative' do
  let(:user){ create_logged_in_user }
  background do
    @initiative = Initiative.create!(:title => 'TestA', :target_date => '01/02/2020', :description => 'ice cream', :completion => false, user: user)
  end
  scenario 'clicks initiative on list view' do
    visit edit_initiative_path(@initiative, user)
    expect(page).to have_content('Edit Initiative')
    expect(@initiative.title).to eq('TestA')
    expect(@initiative.target_date).to eq Date.new(2020,02,01)
    expect(@initiative.description).to eq("ice cream")
  end
  scenario 'change initiative name and target date' do
    visit edit_initiative_path(@initiative, user)
    fill_in 'Initiative Name', with: 'TestB'
    fill_in 'Target Date', with: '01/01/2020'
    fill_in 'Description', with: 'TestJ'
    click_button 'Submit'
    expect(page).to have_content('TestB')
    expect(page).to_not have_content('TestA')
  end
  scenario "delete initiative from list view" do
    visit root_path(user)
    expect { click_link '', :class => "no-link" }.to change(Initiative, :count).by(-1)
    expect(page).to_not have_content('ice cream')
  end
  scenario "display flash message confirming initiative deletion" do
    visit root_path(user)
    expect { click_link '', :class => "no-link" }.to change(Initiative, :count).by(-1)
    expect(page).to have_content('deleted')
  end
  scenario 'click a completion checkbox' do
    visit edit_initiative_path(@initiative, user)
    check "Completed"
    click_button 'Submit'
    expect(page).to have_css("img[src*='icon-completion']")
    expect(page).to have_no_css("img[src*='calendar']")
  end
end
