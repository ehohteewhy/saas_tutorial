class ContactsController < ApplicationController
  
# GET request to /contact-me
# Show new contact form 
    def new
        @contact = Contact.new
    end
    
# POST request to /contacts

    def create
        # Mass assignment of form fields into Contact object
        @contact = Contact.new(contact_params)
        # Save the Contact to object to the database
        if @contact.save
            # Store form fields via parameters, into variables
            name = params[:contact][:name]
            email = params[:contact][:email]
            body = params[:contact][:comments]
            # Plug variables into the Contact Mailer 
            # email method and send email
            ContactMailer.contact_email(name, email, body).deliver
            # Store success message in flast hash
            # redirect to the new action
            flash[:success] = "Message sent."
            redirect_to new_contact_path
        else
            # If Contact object doesn't save,
            # store errors in flash hash and redirect to new action
            flash[:danger] = @contact.errors.full_messages.join(", ")
            redirect_to new_contact_path
        end
    end    
    
    
private
    # To collect from form, we need to use strong parameters
    # and whitelist form fields.
    def contact_params
        params.require(:contact).permit(:name, :email, :comments)
    end    

end    