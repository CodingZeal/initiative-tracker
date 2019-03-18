require 'rails_helper'

describe InitiativesController, type: :controller do
  let!(:initiative) { create(:initiative) }

  it "deletes the initiative" do
    expect{ delete :destroy, params: {id: initiative.id}}.to change(Initiative,:count).by(-1)
    expect(response).to redirect_to root_path
  end
end
  
describe InitiativesController, type: :controller do
    it "orders by initiative status" do
    @initiative = Initiative.new(title: 'initiative1', target_date: "01/01/2020", completion: true)
    @initiative.save
    
    @initiative1 = Initiative.new(title: 'initiative2', target_date: "01/01/2020")
    @initiative1.save

    initiative1 = Initiative.order(:completion).all.to_a
    initiative2 = [@initiative, @initiative1]

    expect(initt).to eq(init)
  end
end
