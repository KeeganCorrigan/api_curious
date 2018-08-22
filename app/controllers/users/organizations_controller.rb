class Users::OrganizationsController < ApplicationController
  def index
    @organizations = GithubPresenter.new(current_user).organizations
  end

end
