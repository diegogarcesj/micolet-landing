class LeadsController < ApplicationController
  def new
    @lead = Lead.new
  end

  def create
    @lead = Lead.new(lead_params)
    if @lead.save
      flash[:success] = 'Subscribed to our newsletter!'
      redirect_to root_path
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
