class AddFeedPhotosToGrandma < ActiveRecord::Migration[7.0]
  def change
    add_column :grandmas, :feed_photos, :string
  end
end
