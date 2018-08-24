class GithubUser
  include ApplicationModule
  attr_reader :username, :uid, :avatar_url, :commits

  def initialize(data)
    @username   = data[:login]
    @uid        = data[:uid]
    @avatar_url = data[:avatar_url]
    @conn       = Faraday.new(url: "https://api.github.com") do |faraday|
                    faraday.headers["Authorization"] = "token #{ENV["GITHUB_TEST"]}"
                    faraday.headers["Accept"] = "application/vnd.github.cloak-preview"
                    faraday.adapter Faraday.default_adapter
                  end
  end

  def commits
    @commits ||= recent_commits
  end

  def recent_commits
    response = @conn.get("/search/commits?q=committer-name:#{@username}+committer-date:>#{search_date}")
    parsed_json = JSON.parse(response.body, symbolize_names: true)

    if parsed_json[:total_count] > 0
      parsed_json[:items].map do |commit|
        Commit.new(commit)
      end
    else
      "No recent commits"
    end
  end
end
