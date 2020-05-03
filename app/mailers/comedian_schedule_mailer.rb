class ComedianScheduleMailer < ApplicationMailer
  before_action :set_lives

  def comedian_schedule_mail
    mail to:@comedian.email, subject:"出演予定ライブ通知のメール"
  end

  private

  def set_lives
    @lives = Live.where(date: Date.today.since(1.days))
    set_comedian(@lives)
  end

  def set_comedian(lives)
    lives.each do |live|
      live.performer_management_comedians.each do |comedian|
        @comedian = comedian
      end
    end
  end

end
