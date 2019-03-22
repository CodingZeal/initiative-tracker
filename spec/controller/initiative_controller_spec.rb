require 'rails_helper'

describe InitiativesController, type: :controller do
  let!(:initiative) { create(:initiative) }

  it "deletes the initiative" do
    expect{ delete :destroy, params: {id: initiative.id}}.to change(Initiative,:count).by(-1)
    expect(response).to redirect_to root_path
  end
end

describe InitiativesController, type: :controller do
  let!(:initiative) { create(:initiative) }
  it "assigns initiatves to @completed_initiatives and @incompleted_initiatives" do
    get :index
    expect(assigns(:incompleted_initiatives)).to eq([initiative])
    expect(assigns(:completed_initiatives)).to eq([])
  end
end

describe InitiativesController, type: :controller do
  let!(:initiative) { create(:initiative) }
  let!(:initiative2) { create(:initiative) }

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
