class CreateSellers < ActiveRecord::Migration[5.0]
  def change
    create_table :sellers do |t|
      t.string :name
      t.string :phone_number
      t.string :email
      t.string :website
      t.string :facebook
      t.string :address
      t.string :image_link
      t.integer :rating

      t.timestamps
    end
  end
end
