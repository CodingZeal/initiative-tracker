desc "This task is called by the Heroku scheduler add-on"

task send_reminders: :environment do
  if Date.current.wday == 1 && Date.current.day <= 7
    UserMailer.send_team_leader_reminder
    UserMailer.send_team_member_reminder
  end
end
