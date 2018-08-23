class Organization
  attr_reader :login, :description, :id, :avatar_url

  def initialize(data)
    @login = data[:login]
    @description = data[:description]
    @id = data[:id]
    @avatar_url = data[:avatar_url]
  end
end
