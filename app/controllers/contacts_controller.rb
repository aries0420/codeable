class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    begin
      @contact = Contact.new(params[:contact])
      @contact.request = request
      if @contact.deliver
        # flash.now[:error] = nil
        flash.now[:notice] = 'Your message has been sent!'
      else
        render "new"
      end
    rescue ScriptError
        flash.now[:error] = 'Sorry, this message was not delivered. Please retry.'
    end
  end
end
