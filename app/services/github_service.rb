class GithubService
  include ApplicationModule

  def initialize(current_user)
    @current_user  = current_user
    @conn          = Faraday.new(url: "https://api.github.com") do |faraday|
                      faraday.headers["Authorization"] = "token #{current_user.oauth_token}"
                      faraday.headers["Accept"] = "application/vnd.github.cloak-preview"
                      faraday.adapter Faraday.default_adapter
                    end
  end

  def followers
    get_url("/users/#{@current_user.nickname}/followers")
  end

  def following
    get_url("/users/#{@current_user.nickname}/following")
  end

  def starred
    get_url("/users/#{@current_user.nickname}/starred")
  end

  def repos(number = 1)
    total_repos = get_url("/users/#{@current_user.nickname}/repos?page=#{number}")
    until total_repos.count >= @current_user.repos
      total_repos << get_url("/users/#{@current_user.nickname}/repos?page=#{number += 1}")
      total_repos.flatten!
    end
    return total_repos
  end

  def organizations
    get_url("/users/#{@current_user.nickname}/orgs")
  end

  def recent_commits(user = @current_user.nickname)
    get_url("/search/commits?q=committer-name:#{user}+committer-date:>#{search_date}")
  end

  private

  def get_url(url)
    response = @conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
