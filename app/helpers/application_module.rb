module ApplicationModule
  def to_datetime(github_date)
    Time.parse(github_date).strftime("%Y-%m-%d")
  end
end
