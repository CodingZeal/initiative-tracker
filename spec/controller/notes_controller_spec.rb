require 'rails_helper'
include ControllerHelpers
include RequestHelpers

describe NotesController, type: :controller do
  login_user
  let(:member) { create(:user, email: "a@gmail.com", team_leader: @user) }
  let(:initiative) { create(:initiative, user: member) }
  let(:valid_item_attributes) {
    { body: "Some Item Title", initiative: initiative, user: @user }
  }
  let(:note) { initiative.notes.create(valid_item_attributes) }

  it "create note" do
    expect{ 
      post :create, 
      params: { initiative_id: initiative.id, user_id: member.id, note: valid_item_attributes } 
    }.to change(Note, :count).by(1)
    expect(response).to redirect_to user_initiative_path(member, initiative)
  end
end
