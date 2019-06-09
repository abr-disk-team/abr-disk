class AnotherAddressesController < ApplicationController
  def new
  	@another_address = AnotherAddress.new
  end
  def create
  	@another_address = AnotherAddress.new(another_address_params)
    @another_address.user_id = current_user.id
    if @another_address.save
      flash[:notice] = "Address was successfully created."
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def edit
  	@another_address = AnotherAddress.find(params[:id])
  end

  def update
  	@another_address = AnotherAddress.find(params[:id])
    if @another_address.user_id == current_user.id && @another_address.update(another_address_params)
      flash[:notice] = "Address was successfully updated."
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def destroy
  	@another_address = AnotherAddress.find(params[:id])
    if @another_address.destroy
      flash[:notice] = "Address was successfully destroyed."
      redirect_to user_path(current_user.id)
    else
      redirect_to user_path(current_user.id)
    end
  end

  private
    # 別住所登録のストロングパラメーター
  def another_address_params
    params.require(:another_address).permit(:address_name,:another_last_name, :another_first_name, :another_last_name_kana, :another_first_name_kana, :another_postcode, :another_prefecture, :another_city, :another_block, :another_building)
  end
end
