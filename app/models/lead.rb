class Lead < ApplicationRecord
  include EmailValidatable
  validate :at_least_one_checkbox

  after_create :send_subscribe_email

  def send_subscribe_email
    SubscribeMailer.with(lead: self).subscribe_email.deliver_now
  end

  private

  def at_least_one_checkbox
    unless women || men || children
      errors.add(:base, I18n.t('custom_errors.at_least_one') )
    end
  end  
end
