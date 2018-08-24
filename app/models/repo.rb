class Repo
  attr_reader :name, :language, :stargazers_count, :html_url, :created_at

  def initialize(data)
    @name = data[:name]
    @language = data[:language]
    @stargazers_count = data[:stargazers_count]
    @html_url = data[:html_url]
    @created_at = data[:created_at]
  end
end
