class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:notice] = "Signed in successfully."
      redirect_to root_path
    else
      flash[:alert] = "Invalid Email or password."
      render "new"
    end
  end


  def destroy
    log_out
      flash[:notice] = "Signed out successfully."
      redirect_to root_path
  end

end
