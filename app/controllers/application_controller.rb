class ApplicationController < ActionController::Base

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
end