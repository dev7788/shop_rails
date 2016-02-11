class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      redirect_to root_path, notice: "User Created!"
    else
      render :new
    end
  end

    private

      def user_params
        params.require(:user).permit([:first_name, :last_name, :email, :password,         :password_confirmation])
      end

end









def create
  @user = User.new(user_params)
  if @user.save
    # session simply checks for the user.ID in the current session?
    # session[:user_id] = @user.id
    sign_in(@user)
    redirect_to root_path, notice: "User Created!"
  else
    render :new
  end
end
#
#
#
