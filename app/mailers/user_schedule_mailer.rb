class UserScheduleMailer < ApplicationMailer

  def user_schedule_mail(user)
    @lives = user.participant_management_lives.where(date: Date.today.since(1.days))
    mail to:user.email, subject:"参加予定ライブ通知のメール"
  end

end