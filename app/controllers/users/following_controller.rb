class Users::FollowingController < ApplicationController
  def index
    @following = GithubPresenter.new(current_user).following
  end
end
