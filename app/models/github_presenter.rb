class GithubPresenter
  def initialize(current_user)
    @current_user = current_user
  end

  def followers
    ghs = GithubService.new(@current_user)
    followers = ghs.followers.map do |follower|
      GithubUser.new(follower)
    end
  end
end
