class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :search
protected
	def configure_permitted_parameters
	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :first_name, :last_name, :first_name_kana, :last_name_kana, :phone_number])
	devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
	end
	def after_sign_in_path_for(resource)
    	items_path # ログイン後はアイテム一覧画面に遷移する
	end

	helper_method :current_cart

	def current_cart
		if session[:cart_id]
		  @cart = Cart.find(session[:cart_id])
		else
		  @cart = Cart.create(:user_id => current_user.id)
		  session[:cart_id] = @cart.id
		end
	end
	def search
		@q = Item.ransack(params[:q])
	end
end