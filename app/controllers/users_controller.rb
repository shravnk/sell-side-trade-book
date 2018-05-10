class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    
    @user = User.create(user_params)
    session[:user_id] = @user.id
    if @user.user_type == "Trader"
      Trader.create(trader_params)
      session[:type] = "Trader"
      redirect_to home_path
    elsif @user.user_type == "Salesperson"
      Salesperson.create(salesperson_params)
      session[:type] = "Salesperson"
      redirect_to home_path
    else
      render 'new'
    end
  end


  def home
    @user = current_user
    if @user.user_type == "Trader"
      @trader = Trader.find_by(username: @user.username)
    elsif @user.user_type == "Salesperson"
      @salesperson = Salesperson.find_by(username: @user.username)
    end
  end

  def new_fb
  end

  def update
    @user.update(user_params)
  end



  private
  def trader_params
    params.require(:user).permit(
      :name,
      :username
      )
  end
  def salesperson_params
    params.require(:user).permit(
      :name,
      :username
      )
  end

  def user_params
    params.require(:user).permit(
      :name,
      :username,
      :password,
      :user_type,
      :uid)
  end


end