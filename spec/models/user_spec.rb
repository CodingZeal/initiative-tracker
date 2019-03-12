# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user' do
    let(:user) { build(:user) }
    context 'when all attributes supplied' do
      it 'user' do
        expect(user).to be_valid
      end
    end
    context 'when attributes are missing' do
      let(:user) { build(:user, fullname: nil, email: nil) }
      it 'cannot be created without fullname, email' do
        expect(user).to_not be_valid
      end
    end
  end
end
