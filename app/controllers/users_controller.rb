class UsersController < ApplicationController
  def show
    @starred = GithubPresenter.new(current_user).starred
    # @recent_commits = GithubPresenter.new(current_user).recent_commits
  end
end

# comment out code
# get page down to one API call

# <% @recent_commits.each do |commit| %>
#   <p><%= commit.date %><p>
#   <p><%= commit.message %><p>
# <% end %>
