class GithubPresenter
  def initialize(current_user)
    @github_service = GithubService.new(current_user)
    @current_user = current_user
  end

  def followers
    @github_service.followers.map do |follower|
      GithubUser.new(follower, @current_user)
    end
  end

  def following
    @github_service.following.map do |following|
      GithubUser.new(following, @current_user)
    end
  end

  def starred
    @github_service.starred.count
  end

  def repos

    @github_service.repos.map do |repo|
      Repo.new(repo)
    end
  end

  def recent_commits
    @github_service.recent_commits[:items].map do |commit|
      Commit.new(commit)
    end
  end

  def organizations
    @github_service.organizations.map do |organization|
      Organization.new(organization)
    end
  end
end
