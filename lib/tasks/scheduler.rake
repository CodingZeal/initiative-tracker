desc "This task is called by the Heroku scheduler add-on"

task send_reminders: :environment do
  UserMailer.send_team_leader_reminder
end
