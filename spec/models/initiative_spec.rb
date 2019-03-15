# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Initiative, type: :model do
  describe 'initiative' do
    let(:initiative) { build(:initiative) }
    context 'when all attributes supplied' do
      it 'initiative' do
        expect(initiative).to be_valid
      end
    end
    context 'when attributes are missing' do
      let(:initiative) { build(:initiative, title: nil, target_date: nil) }
      it 'cannot be created without title, target_date' do
        expect(initiative).to_not be_valid
      end
    end
  end
end

describe InitiativesController, type: :controller do
  let!(:initiative) { create(:initiative) }

  it "deletes the initiative" do
    expect{ delete :destroy, params: {id: initiative.id}}.to change(Initiative,:count).by(-1)
    expect(response).to redirect_to root_path
  end
end

describe "#index" do
  it "orders by initiative status" do
    @initiative = Initiative.new(title: 'initiative1', target_date: "01/01/2020", completion: true)
    @initiative.save
    
    @initiative1 = Initiative.new(title: 'initiative2', target_date: "01/01/2020")
    @initiative1.save

    initt = Initiative.order('completion DESC').all.to_a
    init = [@initiative1, @initiative]

    expect(initt).to eq(init)
  end
end