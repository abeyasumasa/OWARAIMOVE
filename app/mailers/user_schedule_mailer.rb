class UserScheduleMailer < ApplicationMailer
  def user_schedule_mail
    @live = Live.where(date: Date.today.since(1.days))
    @live.each do |live|
      live.participant_management_users.each do |user|
        mail to:user.email, subject:"参加予定ライブ通知のメール"
      end
    end
  end
end
