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

    mail(to: email_with_name(recipient), subject: "Monthly team members' initiatives reminder")
  end
  
  def self.send_team_member_reminder
    @recipients = User.all
    
    @recipients.each do |recipient|
      next unless recipient.initiatives.incompleted.any?
      
      team_member_reminder(recipient).deliver
    end
  end
  
  def team_member_reminder(recipient)
    @recipient = recipient

    mail(to: email_with_name(recipient), subject: "Monthly #{@recipient.fullname}'s initiatives reminder")
  end
  
  def team_leader_new_note_reminder(recipient, initiative, note)
    @recipient = recipient
    @initiative = initiative
    @note = note
    
    mail(to: email_with_name(recipient), subject: "Your team leader left a note in your initiative")
  end
  
  private
  
  def email_with_name(recipient)
    %("#{recipient.fullname}" <#{recipient.email}>)
  end
end
