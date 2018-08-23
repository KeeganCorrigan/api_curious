class UsersController < ApplicationController
  def show
    @github_presenter = GithubPresenter.new(current_user)
  end
end
