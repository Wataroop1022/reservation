class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :email, :password, :image, :introduction))
    if @user.save
      log_in @user
      flash[:notice] = "Welcome! You have signed up successfully."
      redirect_to "/users/profile"
    else
      render "new"
    end
  end

  def profile
    @user = User.find_by(params[:id])
  end

  def update_p
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:name, :email, :password, :image, :introduction))
      flash[:notice] = "Profile was successfully updated."
    redirect_to root_path
    else
      render "edit"
    end
  end

  def account
    @user = User.find_by(params[:id])
  end

  def edit
    @user = User.find_by(params[:id])
  end

  def logout
    session[:user_name] = nil
    redirect_to "/"
  end

end
