class SessionsController < ApplicationController
 skip_before_action :require_login, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    if auth_hash = request.env['omniauth.auth']
      @user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = @user.id
      session[:type] = @user.user_type
      binding.pry
      redirect_to home_path
    else
      if  @user = User.find_by(username: params[:username])

        return head(:forbidden) unless @user.authenticate(params[:password])
        session[:user_id] = @user.id
        session[:type] = @user.user_type
        redirect_to home_path
      else
        redirect_to '/login'
      end
    end
  end

  def destroy
    session.delete("user_id")
    redirect_to signin_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end