require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "Team leader Reminder" do
    let(:user) { build(:user, email: 'example1@test.com') }
    let(:user2) { build(:user, email: 'example2@test.com', team_leader_id: user) }
    let(:initiative4) { create(:initiative, user: user2) }
    let(:initiative5) { create(:initiative, completion: true, user: user2) }

    let(:mail) { UserMailer.team_leader_reminder(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Monthly team members' initiatives reminder")
      expect(mail.to).to eq(["example1@test.com"])
      expect(mail.from).to eq(["notifications@codingzeal.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Please view your current team member's initiative status below:")
    end
  end
  
  describe "Team member Reminder" do
    let(:user) { build(:user, email: 'example1@test.com') }
    let(:user2) { build(:user, email: 'example2@test.com', team_leader_id: user) }
    let(:initiative4) { create(:initiative, user: user2) }
    let(:initiative5) { create(:initiative, completion: true, user: user2) }

    let(:mail) { UserMailer.team_member_reminder(user2) }

    it "renders the headers" do
      expect(mail.subject).to eq("Monthly #{user2.fullname}'s initiatives reminder")
      expect(mail.to).to eq(["example2@test.com"])
      expect(mail.from).to eq(["notifications@codingzeal.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Please view your current initiative status below:")
    end
  end
  
  describe "Team leader create a note to team member email" do
    let(:user) { build(:user, email: 'example1@test.com') }
    let(:user2) { build(:user, email: 'example2@test.com', team_leader_id: user) }
    let(:initiative4) { create(:initiative, user: user2) }
    let(:initiative5) { create(:initiative, completion: true, user: user2) }
    let(:note) { initiative4.notes.create({body: "Some Item Title", initiative: initiative4, user: user }) }

    let(:mail) { UserMailer.team_leader_new_note_reminder(user2, initiative4, note) }

    it "renders the headers" do
      expect(mail.subject).to eq("Your team leader left a note in your initiative")
      expect(mail.to).to eq(["example2@test.com"])
      expect(mail.from).to eq(["notifications@codingzeal.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Your team leader left a note in your initiative.")
    end
  end
end
