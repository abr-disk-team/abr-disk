class ContactsController < ApplicationController
  def index
  end

  def new
  	@contact = Contact.new
  end

  private
  def contact_params
  	params.require(:catact).permit(:category, :ccontact_content)
  end
end
