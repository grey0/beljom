class AddAdminToSeller < ActiveRecord::Migration[5.0]
  def change
    add_column :sellers, :admin, :boolean, default: :false
  end
end
