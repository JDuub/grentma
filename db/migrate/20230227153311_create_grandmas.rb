class CreateGrandmas < ActiveRecord::Migration[7.0]
  def change
    create_table :grandmas do |t|
      t.string :first_name
      t.string :last_name
      t.text :location
      t.string :skills
      t.text :description
      t.text :image_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
