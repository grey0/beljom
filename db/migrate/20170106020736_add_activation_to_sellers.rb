class AddActivationToSellers < ActiveRecord::Migration[5.0]
  def change
    add_column :sellers, :activation_digest, :string
    add_column :sellers, :activated, :boolean
    add_column :sellers, :activated_at, :datetime
  end
end
