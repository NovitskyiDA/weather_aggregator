class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)
    @contact.request = request
    if @contact.deliver
      redirect_to root_path, notice: I18n.t('notice.successfully_contacted')
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
