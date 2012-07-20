class SessionsController < ApplicationController

  def new
    if signed_in?
      flash[:notice] = "Sorry! That was an unauthorized action"
      redirect_to current_user
    end
  end

  def create
  	if signed_in?
      flash[:notice] = "Sorry! That was an unauthorized action"
      redirect_to current_user
    else
      user = User.find_by_email(params[:session][:email])
      if user && user.authenticate(params[:session][:password])
        sign_in user
        redirect_back_or user
      else
        flash.now[:error] = "Invalid email/password combination"
        render 'new'
      end
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end