class ContactMailer < ActionMailer::Base
  default to: 'mariob360@gmail.com'
  
  # email this is being sent to ^
  
  def contact_email(name, email, body)
    #contents of email 
    @name = name 
    @email = email
    @body = body
    
    #takes values and puts them into instance variables to be used in interpolation/variable to be used in a view
    
    mail(from: email, subject: 'Contact Form Message')
  end
end

