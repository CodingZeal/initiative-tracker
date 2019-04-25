class UserMailer < ApplicationMailer
  default from: 'notifications@codingzeal.com'

  def self.send_team_leader_reminder
    @team_leaders = User.where(id: User.all.pluck(:team_leader_id).compact.uniq)

    @team_leaders.each do |team_leader|
      next unless team_leader.team_members.select { |tm| tm.initiatives.incompleted.any? }.any?

      team_leader_reminder(team_leader).deliver
    end
  end

  def team_leader_reminder(recipient)
    @recipient = recipient

    email_with_name = %("#{@recipient.fullname}" <#{@recipient.email}>)
    mail(to: email_with_name, subject: "Monthly team members' initiatives reminder")
  end
end