class GithubService
  def initialize(current_user)
    @current_user  = current_user.nickname
    @conn          = Faraday.new(url: "https://api.github.com") do |faraday|
                      faraday.headers["Authorization"] = current_user.oauth_token
                      faraday.adapter Faraday.default_adapter
                    end
  end

  def followers
    get_url("/users/#{@current_user}/followers")
  end

  def following
    get_url("/users/#{@current_user}/following")
  end

  def get_url(url)
    response = @conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
