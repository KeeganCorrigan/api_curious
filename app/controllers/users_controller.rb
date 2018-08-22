class UsersController < ApplicationController
  def show
    @starred = GithubPresenter.new(current_user).starred
  end
end
