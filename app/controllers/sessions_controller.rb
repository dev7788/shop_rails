class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in(user)
      redirect_to root_path, flash: { success: "Signed in..." }
    else
      flash[:danger] = "Email/Password combination not valid..."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, flash: { warning: "Successfully Logged Out!" }
  end

end
