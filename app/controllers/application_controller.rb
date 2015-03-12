class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def login(user)
    user.reset_session_token!
    session[:token] = user.session_token
    redirect_to user_url
  end

  def current_user
    User.find_by(session_token: session[:token])
  end

end
