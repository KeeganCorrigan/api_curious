class Users::FollowersController < ApplicationController
  def index
    @followers = GithubPresenter.new(current_user).followers
  end
end
