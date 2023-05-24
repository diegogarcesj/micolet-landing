class SurveyController < ApplicationController
  include Wicked::Wizard
  
  steps :participate, :birthdate, :sustainable, :channel, :coupon

  before_action :set_lead, only: [ :show, :update ]

  def show
    case step
    when :participate
    when :birthdate
    when :sustainable
    when :channel
    when :coupon
    end
    render_wizard
  end

  def update
    case step
    when :participate
    when :birthdate
      @lead.birthdate = Date.new(survey_params['birthdate(1i)'].to_i, survey_params['birthdate(2i)'].to_i, survey_params['birthdate(3i)'].to_i)
      @lead.save
    when :sustainable
      @lead.update(survey_params)
    when :channel
      @lead.update(survey_params)
      @lead.generate_discount_coupon
    when :coupon
    end
    render_wizard @lead
  end

  private

  def survey_params
    params.require(:lead).permit(
      :birthdate,
      :sustainable,
      :channel,
    )
  end

  def set_lead
    @lead = Lead.find(params[:lead_id])
  end
end
