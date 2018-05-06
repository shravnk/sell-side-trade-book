class SessionsController < ApplicationController
 skip_before_action :require_login, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    
    if @user = User.find_by(username: params[:username])
      return head(:forbidden) unless @user.authenticate(params[:password])
      session[:user_id] = @user.id
      session[:type] = @user.user_type
      redirect_to home_path
    else
      render 'new'
    end
  end

  def destroy
    session.delete("user_id")
    redirect_to signin_path
  end
end