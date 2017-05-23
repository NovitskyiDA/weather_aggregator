class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)
    @contact.request = request
    if @contact.deliver
      redirect_to root_path, notice: 'Thank you for your message. We will contact you soon!'
    else
      render :new, notice: 'Cannot send message'
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
