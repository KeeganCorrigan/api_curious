class GithubService
  def initialize(current_user)
    @current_user  = current_user.nickname
    @conn          = Faraday.new(url: "https://api.github.com") do |faraday|
                      faraday.headers["Authorization"] = current_user.oauth_token
                      faraday.headers["Accept"] = "application/vnd.github.cloak-preview"
                      faraday.adapter Faraday.default_adapter
                    end
  end

  def followers
    get_url("/users/#{@current_user}/followers")
  end

  def following
    get_url("/users/#{@current_user}/following")
  end

  def starred
    get_url("/users/#{@current_user}/starred")
  end

  def repos
    get_url("/users/#{@current_user}/repos")
  end

  def organizations
    get_url("/users/#{@current_user}/orgs")
  end

  def search_date
    one_week_ago = 1.week.ago.strftime("%Y-%m-%d")
  end

  def recent_commits
    get_url("/search/commits?q=committer-name:#{@current_user}+committer-date:>#{search_date}")
  end

  def get_url(url)
    response = @conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
