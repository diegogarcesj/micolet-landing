# Preview all emails at http://localhost:3000/rails/mailers/subscribe_mailer
class SubscribeMailerPreview < ActionMailer::Preview
  def subscribe_email
    lead = Lead.last
    SubscribeMailer.with(lead: lead).subscribe_email
  end
end
