class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :rating
      t.integer :category_id
      t.integer :seller_id
      t.boolean :approved, default: false
      t.integer :approved_by

      t.timestamps
    end
  end
end
