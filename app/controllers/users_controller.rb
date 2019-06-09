class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def index
  	@users = User.all
  end

  def update
    @user = User.find(params[:id])
    if @user == current_user && @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
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
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :phone_number, :postcode, :prefecture, :city, :block, :building)
  end
  def another_address_params
    params.require(:another_address).permit(:another_last_name, :another_first_name, :another_last_name_kana, :another_first_name_kana, :another_postcode, :another_prefecture, :another_city, :another_block, :another_building)
  end
end
