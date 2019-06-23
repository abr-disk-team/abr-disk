class AddressesController < ApplicationController
  def new
  	@address = Address.new
  end
  def create
  	@address = Address.new(address_params)
    @address.user_id = current_user.id
    if @address.save
      flash[:notice] = "Address was successfully created."
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end
  def edit
  	@address = Address.find(params[:id])
  end
  def update
  	@address = Address.find(params[:id])
    if @address.user_id == current_user.id && @address.update(address_params)
      flash[:notice] = "Address was successfully updated."
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end
  def destroy
  	@address = Address.find(params[:id])
    if @address.destroy
      flash[:notice] = "Address was successfully destroyed."
      redirect_to user_path(current_user.id)
    else
      redirect_to user_path(current_user.id)
    end
  end

private
    # 住所登録のストロングパラメーター
  def address_params
    params.require(:address).permit(:address_name, :postcode, :prefecture, :city, :block, :building)
  end
end
