namespace :send_schedule do
  desc "ユーザーに明日参加予定のライブ情報を通知"
  task user_schedule: :environment do
    #明日開催予定のライブを全て抽出
    @lives = Live.where(date: Date.today.since(1.days))
    #明日開催予定のライブに参加するユーザー一覧を取得
    @lives.each do |live|
      live.participant_management_users.each do |user|
        #参加予定のライブをお知らせする
        UserScheduleMailer.user_schedule_mail(user).deliver
      end
    end
  end

  desc "芸人に明日出演予定のライブ情報を通知"
  task comedian_schedule: :environment do
    #明日開催予定のライブを全て抽出
    @lives = Live.where(date: Date.today.since(1.days))
    #明日開催予定のライブに出演する芸人一覧を取得
    @lives.each do |live|
      live.performer_management_comedians.each do |comedian|
        #出演予定のライブをお知らせする
        ComedianScheduleMailer.comedian_schedule_mail(comedian).deliver
      end
    end
  end
  
end