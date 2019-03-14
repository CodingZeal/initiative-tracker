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

describe 'DELETE destroy', type: :controller do
    let(:initiative) { build(:initiative) }
  
  it "deletes the initiative" do
    expect(
      delete :destroy => @initiative 
    ).to change(Initiative,:count).by(-1)
  end
    
  # it "redirects to initiative#index" do
  #   delete :destroy, id: @initiative
  #   response.should redirect_to root_to_url
  # end
end