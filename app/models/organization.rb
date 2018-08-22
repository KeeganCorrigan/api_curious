class Organization
  attr_reader :login, :description, :uid, :repos_url

  def initialize(data)
    @login = data[:login]
    @description = data[:description]
    @uid = data[:uid]
    @repos_url = data[:repos_url]
  end

end
