class Commit
  attr_reader :url, :date, :name, :message, :repo_name

  def initialize(data)
    @url = data[:commit][:url]
    @date = data[:commit][:author][:date]
    @name = data[:commit][:author][:name]
    @message = data[:commit][:message]
    @repo_name = data[:repository][:name]
  end
end
