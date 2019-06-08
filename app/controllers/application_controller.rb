class ApplicationController < ActionController::Base


	def after_sign_in_path_for(resource)
    	items_path # ログイン後はアイテム一覧画面に遷移する
	end
end
