class ApplicationController < ActionController::Base
	before_action :require_login
	helper_method :current_user, :user_is_trader, :select_trader

def current_user
	User.find_by(id: session[:user_id])
end
private
def require_login
	redirect_to signin_path unless session.include? :user_id
end


def user_is_trader
	session[:type] == "Trader" && Trader.all.pluck(:username).include?(current_user.username)
end

def user_is_salesperson
	session[:type] == "Salesperson" && Salesperson.all.pluck(:username).include?(current_user.username)
end

 def select_trader
    Trader.find_by(username: current_user.username).try(:id)
  end

end
