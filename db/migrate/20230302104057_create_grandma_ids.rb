class CreateGrandmaIds < ActiveRecord::Migration[7.0]
  def change
    create_table :grandma_ids do |t|
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
