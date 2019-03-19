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

  describe InitiativesController, type: :model do
    let!(:initiative) { create(:initiative) }
    it "assign incompleted initiatives" do
      incompleted_initiatives = Initiative.incompleted
      expect(incompleted_initiatives).to eq([initiative])
    end
  end

  describe InitiativesController, type: :model do
    let!(:initiative) { create(:initiative) }
    it "assign completed initiatives" do
      completed_initiatives = Initiative.completed
      expect(completed_initiatives).to eq([])
    end
  end
end
