require 'rails_helper'
include ControllerHelpers

describe InitiativesController, type: :controller do
  login_user
  let!(:initiative) { create(:initiative) }
  let(:initiative2) { create(:initiative) }

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
end
