class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :email
    end
  end
end