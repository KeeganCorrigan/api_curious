class GithubPresenter
  def initialize(current_user)
    @current_user = current_user
    @github_service = GithubService.new(current_user)
  end

  def followers
    @github_service.followers.map do |follower|
      GithubUser.new(follower)
    end
  end

  def following
    @github_service.following.map do |following|
      GithubUser.new(following)
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
end
