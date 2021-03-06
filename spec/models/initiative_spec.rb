# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Initiative, type: :model do
  let(:user) { build(:user) }
  describe 'initiative' do
    let(:initiative) { build(:initiative, user: user) }
    context 'when all attributes supplied' do
      it 'initiative' do
        expect(initiative).to be_valid
      end
    end
    context 'when attributes are missing' do
      let(:initiative) { build(:initiative, title: nil, target_date: nil, user: user) }
      it 'cannot be created without title, target_date' do
        expect(initiative).to_not be_valid
      end
    end
  end
  
  context 'scopes' do
    let(:user) { build(:user) }
    let(:incomplete_initiative) { create(:initiative, user: user) }
    let(:completed_initiative) { create(:initiative, completion: true, user: user) }

    it "assign incompleted initiatives" do
      expect(Initiative.incompleted).to eq([incomplete_initiative])
    end

    it "assign completed initiatives" do
      expect(Initiative.completed).to eq([completed_initiative])
    end
  end
end
