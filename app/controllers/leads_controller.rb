class LeadsController < ApplicationController
  def index
    redirect_to root_path
  end

  def new
    @lead = Lead.new
  end

  def create
    @lead = Lead.new(lead_params)
    if @lead.save
      flash[:success] = I18n.t('flash.subscribed')
      redirect_to lead_survey_index_path(@lead)
    else
      render :new
    end
  end

  private

  def lead_params
    params.require(:lead).permit(
      :email,
      :women,
      :men,
      :children
    )
  end
end
