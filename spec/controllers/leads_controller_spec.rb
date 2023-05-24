require 'rails_helper'

RSpec.describe LeadsController, type: :controller do
  
  describe 'POST #create' do
    before do
      allow_any_instance_of(Lead).to receive(:validate_email_with_api)
    end

    after do
      allow_any_instance_of(Lead).to receive(:validate_email_with_api).and_call_original
    end

    context 'with valid parameters' do
      it 'creates a new lead' do
        expect {
          post :create, params: { lead: { email: 'juanperez@gmail.com', women: true, men: true, children: true } }
        }.to change(Lead, :count).by(1)
      end

      it 'redirects to the survey' do
        post :create, params: { lead: { email: 'juanperez@gmail.com', women: true, men: true, children: true } }
        expect(response).to redirect_to(lead_survey_index_path(Lead.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new lead' do
        expect {
          post :create, params: { lead: { email: 'invalid_email', women: false, men: false, children: false } }
        }.not_to change(Lead, :count)
      end

      it 'renders the new template' do
        post :create, params: { lead: { email: 'invalid_email', women: false, men: false, children: false } }
        expect(response).to render_template(:new)
      end
    end

    
  end
end
