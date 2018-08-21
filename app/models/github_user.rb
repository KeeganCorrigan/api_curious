class GithubUser
  attr_reader :username, :uid, :avatar_url

  def initialize(data)
    @username   = data[:login]
    @uid        = data[:uid]
    @avatar_url = data[:avatar_url]
  end
end
