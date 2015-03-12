class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    email = session_params[:email]
    password = session_params[:password]
    @user = User.find_by_credentials(email, password)
    if @user.nil?
      render :new
      #bad username/password error
    else
      login(@user)
    end
  end

  def destroy
    if current_user
      current_user.reset_session_token!
      session[:token] = nil
    end
    redirect_to new_session_url
  end

private

  def session_params
    params.require(:user).permit(:email, :password)
  end

end
