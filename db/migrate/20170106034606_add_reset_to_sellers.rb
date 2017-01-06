class AddResetToSellers < ActiveRecord::Migration[5.0]
  def change
    add_column :sellers, :reset_digest, :string
    add_column :sellers, :reset_sent_at, :datetime
  end
end
