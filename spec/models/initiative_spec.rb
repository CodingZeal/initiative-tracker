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

  context 'scopes' do
    let(:incomplete_initiative) { create(:initiative) }
    let(:completed_initiative) { create(:initiative, completion: true) }

    it "assign incompleted initiatives" do
      expect(Initiative.incompleted).to eq([incomplete_initiative])
    end

    it "assign completed initiatives" do
      expect(Initiative.completed).to eq([completed_initiative])
    end
  end
end
<<<<<<< HEAD
=======

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
>>>>>>> model test passed, rubocop passed, indicator of completion displayed on individual initiative card, completed initiatives will appear separately from incomplete initiatives on list view page
