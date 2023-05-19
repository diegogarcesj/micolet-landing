require 'rails_helper'

RSpec.describe Lead, type: :model do

  before do
    Lead.skip_callback(:validate, :before, :validate_email_with_api)
    Lead.skip_callback(:create, :after, :send_subscribe_email)
  end

  after do
    Lead.set_callback(:validate, :before, :validate_email_with_api)
    Lead.set_callback(:create, :after, :send_subscribe_email)
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should allow_value('juanperez@gmail.com').for(:email) }
    it { should_not allow_value('invalid_email').for(:email) }
  end

  it "is valid with valid attributes" do
    lead = Lead.new(email: "juanperez@gmail.com", women: true, men: true, children: true )
    expect(lead).to be_valid
  end
  
  it "is valid with valid attributes with at least one checkbox" do
    lead = Lead.new(email: "juanperez@gmail.com", women: true, men: false, children: false )
    expect(lead).to be_valid
  end

  it "is not valid with valid email but without checkbox" do
    lead = Lead.new(email: "juanperez@gmail.com", women: false, men: false, children: false)
    expect(lead).not_to be_valid
  end

  it "is not valid with invalid attributes" do
    lead = Lead.new(email: "invalid_email", women: false, men: false, children: false)
    expect(lead).not_to be_valid
  end
end
