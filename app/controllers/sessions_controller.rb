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
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def destroy
    session.delete("user_id")
    redirect_to root_path
  end
end