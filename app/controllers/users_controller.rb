class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  def new
    redirect_to home_path unless !current_user
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      if @user.user_type == "Trader"
        Trader.create(trader_params)
        session[:type] = "Trader"
        redirect_to home_path
      elsif @user.user_type == "Salesperson"
        Salesperson.create(salesperson_params)
        session[:type] = "Salesperson"
        redirect_to home_path
      end
    else
      render :new
    end
  end


  def home
    @user = current_user
    if @user.user_type == "Trader"
      @trader = Trader.find_by(username: @user.username)
      @transacts = Transact.where(trader_id: @trader.id).not_pending
    elsif @user.user_type == "Salesperson"
      @salesperson = Salesperson.find_by(username: @user.username)
      @transacts = Transact.joins(:salesperson_transacts).where(salesperson_transacts: {salesperson_id: @salesperson.id}).not_pending
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