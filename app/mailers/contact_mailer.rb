class ContactMailer < ActionMailer::Base
    default to: 'mm9gtan@gmail.com'
    
    def contact_email(name, email, body)
        @name = name
        @email = email
        @body = body
        
        mail(from: email, subject:'New Contact Message')
  
    end    


end    