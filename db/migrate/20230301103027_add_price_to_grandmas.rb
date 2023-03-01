class AddPriceToGrandmas < ActiveRecord::Migration[7.0]
  def change
    add_column :grandmas, :price, :decimal
  end
end
