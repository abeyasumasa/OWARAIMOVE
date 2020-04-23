class ComedianScheduleMailer < ApplicationMailer
  def comedian_schedule_mail
    @live = Live.where(date: Date.today.since(1.days))
    @live.each do |live|
      live.performer_management_comedians.each do |comedian|
        mail to:comedian.email, subject:"出演予定ライブ通知のメール"
      end
    end
  end
end
