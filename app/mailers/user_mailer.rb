class UserMailer < ApplicationMailer
  default from: 'notifications@codingzeal.com'

  def self.send_team_leader_remainder
    @team_leaders = User.all
    @team_leaders.each do |team_leader|
      team_leader_reminder(team_leader).deliver
    end
  end

  def team_leader_reminder(recipient)
    @recipient = recipient

    email_with_name = %("#{@recipient.name}" <#{@recipient.email}>)
    mail(to: email_with_name, subject: "Monthly team members' initiatives reminder")
  end
end
