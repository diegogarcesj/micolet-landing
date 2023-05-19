class SubscribeMailer < ApplicationMailer
  
  def subscribe_email
    @lead = params[:lead]
    mail(to: @lead.email, subject: "Subscribed to our newsletter!")
  end
end
