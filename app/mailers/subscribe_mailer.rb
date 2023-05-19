class SubscribeMailer < ApplicationMailer
  
  def subscribe_email
    @lead = params[:lead]
    mail(to: @lead.email)
  end
end
