class UsersController < ApplicationController

  def index
  	@users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user == current_user && @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "User was successfully destroyed."
      redirect_to users_path
    else
      redirect_to users_path
    end
  end

  def another_address
    @another_address = AnotherAddress.new
  end

  def another_address_create
    @another_address = AnotherAddress.new(another_address_params)
    @another_address.user_id = current_user.id
    if @another_address.save
      redirect_to user_path(current_user.id)
    else
      render :another_address
    end
  end

  private
  # ユーザー登録・更新のストロングパラメーター
  def user_params
    params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :phone_number, :postcode, :prefecture, :city, :block, :building)
  end
  # 別住所登録のストロングパラメーター
  def another_address_params
    params.require(:another_address).permit(:another_last_name, :another_first_name, :another_last_name_kana, :another_first_name_kana, :another_postcode, :another_prefecture, :another_city, :another_block, :another_building)
  end
end
