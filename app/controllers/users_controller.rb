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
      binding.pry
      redirect_to user_path(@user)
    elsif @user.user_type == "Salesperson"
      Salesperson.create(salesperson_params)
      session[:type] = "Salesperson"
      redirect_to user_path(@user) 
    else
      render 'new'
    end
  end

  def show
    
    @user = User.find_by(id: params[:id])
  end

  def destroy
    session.delete("user_id")
    redirect_to root_path
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
      :user_type)
  end


end