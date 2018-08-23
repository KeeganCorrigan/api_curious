class Users::ReposController < ApplicationController
  def index
    @repos = GithubPresenter.new(current_user).repos
  end
end
