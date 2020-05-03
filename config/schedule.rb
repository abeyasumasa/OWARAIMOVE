set :output, "log/crontab.log"
set :environment, :production

every 1.days, at: "8:00 am" do
  runner "UserScheduleMailer.user_schedule_mail.deliver_now"
  runner "ComedianScheduleMailer.comedian_schedule_mail.deliver_now"
end
