class Users::FollowingController < ApplicationController
  def index
    @github_presenter = GithubPresenter.new(current_user)
  end
end
