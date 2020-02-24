module LivesHelper
  def simple_time(time)
    time.strftime(" %H時%M分")
  end

  def simple_day(date)
    weeks = ["月","火","水","木","金","土","日"]
    index = date.strftime("%u").to_i
    date.strftime("%Y年%-m月%-d日 (#{weeks[index - 1]})")
  end
end
