class CreateLeads < ActiveRecord::Migration[7.0]
  def change
    create_table :leads do |t|
      t.string :email
      t.boolean :women
      t.boolean :men
      t.boolean :children

      t.timestamps
    end
  end
end
