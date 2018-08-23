class Commit
  include ApplicationModule
  attr_reader :url, :date, :name, :message, :repo_name

  def initialize(data)
    @url = data[:commit][:url]
    @date = to_datetime(data[:commit][:author][:date][0..9])
    @name = data[:commit][:author][:name]
    @message = data[:commit][:message]
    @repo_name = data[:repository][:name]
  end
end
