class UsersController < ApplicationController
  def show
    @starred = GithubPresenter.new(current_user).starred
    @recent_commits = GithubPresenter.new(current_user).recent_commits
  end
end
