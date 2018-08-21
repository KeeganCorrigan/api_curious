class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.from_omniauth(request.env["omniauth.auth"])

    binding.pry
    if user.valid?
      session[:user_id] = user.id
      redirect_to user_path(current_user)
    end
  end

  def destroy
    reset_session
    redirect_to request.referer
  end
end
