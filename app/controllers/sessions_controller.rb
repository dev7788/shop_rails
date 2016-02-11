class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      sign_in(user)
      redirect_to root_path, notice: "Signed in..."
    else
      flash[:alert] = "Email/Password combination not valid..."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Successfully Logged Out!"
  end

end
