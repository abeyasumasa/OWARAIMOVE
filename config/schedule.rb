# ログファイルの出力先
set :output, "log/crontab.log"
# 絶対パスから相対パス指定
ENV["RAILS_ENV"] ||= "production"
# ジョブの実行環境の指定
set :environment, ENV["RAILS_ENV"]

every 1.day at: "8:00 am" do
  runner "send_schedule:user_schedule"
  runner "send_schedule:comedian_schedule"
end
