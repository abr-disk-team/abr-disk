class UsersController < ApplicationController

  def index
  	@users = User.all
    @deleted_users = User.only_deleted
  end

  def show
    # "User.with_deleted"で論理削除したユーザーとしていないユーザーを合わせて取得
    @user = User.with_deleted.find(params[:id])
    @favorites = Favorite.where(user_id: current_user.id).limit(5)
  end

  def edit
    @user = User.find(params[:id])
  end

  def address_edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user == current_user && @user.update(user_params)
      flash[:notice] = "User was successfully updated."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user == current_user && @user.destroy
      flash[:notice] = "当サイトをご利用いただきありがとうございました。"
      redirect_to root_path
    elsif @user != current_user && @user.destroy
      flash[:notice] = "User was successfully destroyed."
      redirect_to users_path
    else
      redirect_to user_path(current_user)
    end
  end

  private
  # ユーザー登録・更新のストロングパラメーター
  def user_params
    params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :phone_number, :email, :postcode, :prefecture, :city, :block, :building)
  end
  # 別住所登録のストロングパラメーター
  def another_address_params
    params.require(:another_address).permit(:address_name,:another_last_name, :another_first_name, :another_last_name_kana, :another_first_name_kana, :another_postcode, :another_prefecture, :another_city, :another_block, :another_building)
  end
end
