class UserScheduleMailer < ApplicationMailer
  before_action :set_lives

  def user_schedule_mail(@user)
    mail to:@user.email, subject:"参加予定ライブ通知のメール"
  end

  private

  def set_lives
    @lives = Live.where(date: Date.today.since(1.days))
    set_user(@lives)
  end

  def set_user(@lives)
    @lives.each do |live|
      live.participant_management_users.each do |user|
        @user = user
      end
    end
  end

end