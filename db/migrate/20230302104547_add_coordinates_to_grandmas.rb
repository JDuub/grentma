class AddCoordinatesToGrandmas < ActiveRecord::Migration[7.0]
  def change
    add_column :grandmas, :latitude, :float
    add_column :grandmas, :longitude, :float
  end
end
