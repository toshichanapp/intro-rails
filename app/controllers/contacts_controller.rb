class ContactsController < ApplicationController
    
    def new
        @contact = Contact.new
    end
    
    def create
        @contact = Contact.new(contact_params)
        @contact.save!
        redirect_to new_contact_url
    end
    
    private
    
    def contact_params
        params.require(:contact).permit(:neme, :email, :content)
    end
end
