every 1.days, at: '4:30 am' do
  runner 'UserScheduleMailer.user_schedule_mail.deliver_now'
  runner 'ComedianScheduleMailer.comedian_schedule_mail.deliver_now'
end
