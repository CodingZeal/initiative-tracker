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
  it "assign incompleted initiatives" do
    incompleted_initiatives = Initiative.incompleted
    expect(incompleted_initiatives).to eq([initiative])
  end
end

describe InitiativesController, type: :controller do
  let!(:initiative) { create(:initiative) }
  it "assign completed initiatives" do
    completed_initiatives = Initiative.completed
    expect(completed_initiatives).to eq([])
  end
end
