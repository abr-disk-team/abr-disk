class ContactsController < ApplicationController
  def index
  	@contacts = Contact.all
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
  		render "new"
  	end
  end

  private
  def contact_params
  	params.require(:contact).permit(:category, :contact_content)
  end
end