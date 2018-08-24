class GithubUser
  include ApplicationModule

  attr_reader :username, :uid, :avatar_url, :commits

  def initialize(data, current_user = nil)
    @username   = data[:login]
    @uid        = data[:uid]
    @avatar_url = data[:avatar_url]
    @current_user = current_user
  end

  def commits
    @commits ||= recent_commits
  end

  def recent_commits
    response = GithubService.new(@current_user).recent_commits(@username)
    validate_commits(response)
  end

  private

  def validate_commits(response)
    if response[:total_count] > 0
      response[:items].map do |commit|
        Commit.new(commit)
      end
    else
      "No recent commits"
    end
  end
end
