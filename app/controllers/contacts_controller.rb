class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def create      #post action = create action 
    @contact = Contact.new(contact_params)
    if @contact.save # saves contents to database 
      name = params[:contact][:name] # [key] [key] this will give you the value of connected to that key /// nested hash
      email = params[:contact][:email] # collects 3 parameters from what the user inputs/then used in contact_email function
      body = params[:contact][:comments]
      ContactMailer.contact_email(name, email, body).deliver #executes the function inside of the contact_mailer.rb
      flash[:success] = "Message sent." #sends message to top of clients view
      redirect_to new_contact_path #refreshes page
    else
      flash[:danger] = @contact.errors.full_messages.join(", ")
      redirect_to new_contact_path
    end
  end
  
  private
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end
end