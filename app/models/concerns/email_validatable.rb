require 'net/http'
require 'net/https'

module EmailValidatable
  extend ActiveSupport::Concern

  included do
    validates :email, presence: true, uniqueness: :true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validate :validate_email_with_api
  end

  private

  def validate_email_with_api
    api_key = ENV['ABSTRACT_API_KEY']
    uri = URI("https://emailvalidation.abstractapi.com/v1/?api_key=#{api_key}&email=#{email}")

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    request =  Net::HTTP::Get.new(uri)
    response = http.request(request)

    puts "Status code: #{ response.code }"
    puts "Response body: #{ response.body }"

    unless response.code.to_i == 200 && JSON.parse(response.body).try(:[], "quality_score").try(:to_f) > 0.7
      errors.add(:email, I18n.t('custom_errors.invalid_email'))
    end
  rescue StandardError => error
    puts "Error (#{ error.message })"
    errors.add(:email, I18n.t('custom_errors.error_api'))
  end
end