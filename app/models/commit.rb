class Commit
  attr_reader :url, :date, :name, :message

  def initialize(data)
    @url = data[:commit][:url]
    @date = data[:commit][:author][:date]
    @name = data[:commit][:author][:name]
    @message = data[:commit][:message]
  end
end
