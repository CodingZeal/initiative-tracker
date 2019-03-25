require 'rails_helper'
include ControllerHelpers

describe InitiativesController, type: :controller do
  login_user
  let(:user2) {build(:user, email: 'example2@test.com')}
  let!(:initiative) { create(:initiative, user: @user) }
  let(:initiative2) { create(:initiative, user: @user) }
  let(:initiative3) { create(:initiative, completion: true, user: @user) }
  let(:initiative4) { create(:initiative, user: user2) }
  let(:initiative5) { create(:initiative, completion: true, user: user2) }

  it "deletes the initiative" do
    expect{ delete :destroy, params: {id: initiative.id}}.to change(Initiative,:count).by(-1)
    expect(response).to redirect_to root_path
  end

  it "assigns initiatives to @completed_initiatives and @incompleted_initiatives" do
    get :index
    expect(assigns(:incompleted_initiatives)).to eq([initiative, initiative2])
    expect(assigns(:completed_initiatives)).to eq([])
  end

  it "update initiatives" do
    params = {
      completion: true
    }
    put :update, params: {id: initiative.id, initiative: params}

    expect(response).to redirect_to root_path
    expect(assigns(:incompleted_initiatives)).to eq([initiative2])
    expect(assigns(:completed_initiatives)).to eq([initiative])
  end
  it "sees own initiatives only" do
    get :index
    expect(assigns(:incompleted_initiatives)).to eq([initiative, initiative2])
    expect(assigns(:completed_initiatives)).to eq([initiative3])
    expect(assigns(:incompleted_initiatives)).not_to eq([initiative4])
    expect(assigns(:completed_initiatives)).not_to eq([initiative5])
  end
end
