class ComedianScheduleMailer < ApplicationMailer

  def comedian_schedule_mail(comedian)
    @lives = comedian.performer_management_lives.where(date: Date.today.since(1.days))
    mail to:comedian.email, subject:"出演予定ライブ通知のメール"
  end

end
