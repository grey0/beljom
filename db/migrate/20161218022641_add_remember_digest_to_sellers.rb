class AddRememberDigestToSellers < ActiveRecord::Migration[5.0]
  def change
    add_column :sellers, :remember_digest, :string
  end
end
