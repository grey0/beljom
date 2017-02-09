class AddSellerNameAndContactToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :seller_name, :string, default: :null
    add_column :products, :contact, :string, default: :null
  end
end
