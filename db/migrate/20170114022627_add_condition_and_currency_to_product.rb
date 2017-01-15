class AddConditionAndCurrencyToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :currency, :integer, default: 0
    add_column :products, :condition, :integer
  end
end
