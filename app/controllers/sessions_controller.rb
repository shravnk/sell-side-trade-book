class SessionsController < ApplicationController
 skip_before_action :require_login, only: [:new, :create]
  def new
    redirect_to home_path unless !current_user
    @user = User.new
  end

  def create
    if auth_hash = request.env['omniauth.auth']
      # binding.pry
      @user = User.find_or_create_by(uid: auth_hash[:uid])
      if @user.user_type
        session[:user_id] = @user.id
        session[:type] = @user.user_type
        redirect_to home_path
      else
        render '/users/new'
      end
    else
      if  @user = User.find_by(username: params[:username])
        if @user.authenticate(params[:password])
          session[:user_id] = @user.id
          session[:type] = @user.user_type
          redirect_to home_path
        else
          render 'new'
        end
      else
        render 'new'
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