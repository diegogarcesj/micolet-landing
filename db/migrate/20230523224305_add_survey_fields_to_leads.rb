class AddSurveyFieldsToLeads < ActiveRecord::Migration[7.0]
  def change
    add_column :leads, :birthdate, :date
    add_column :leads, :sustainable, :boolean
    add_column :leads, :channel, :integer
    add_column :leads, :coupon, :string
  end
end
