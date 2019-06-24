class ContactsController < ApplicationController
  def index
    unless user_signed_in? && current_user.admin
      redirect_to new_contact_path
    end
    @contacts = Contact.all
  end

  def show
    unless user_signed_in? && current_user.admin
      redirect_to new_contact_path
    end
    @contact = Contact.find(params[:id])
  end

  def new
  	@contact = Contact.new
  end

  def complete
  end

  def create
  	@contact = Contact.new(contact_params)
  	if @contact.save
  		redirect_to complete_path
  	else
  		render :action => "new"
  	end
  end

  def update
    @contact_edit = Contact.find(params[:id])
    @contact_edit.update(contact_params)
    redirect_to contacts_path
    end

  private
  def contact_params
  	params.require(:contact).permit(:category, :contact_content, :name, :contact_email, :status)
  end
end