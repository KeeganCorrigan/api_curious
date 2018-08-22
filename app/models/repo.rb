class Repo
  attr_reader :name, :language, :stargazers_count

  def initialize(data)
    @name = data[:name]
    @language = data[:language]
    @stargazers_count = data[:stargazers_count]
  end
end
