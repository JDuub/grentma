class ChangeFeedPhotosToArrayInGrandmas < ActiveRecord::Migration[7.0]
  def change
    change_column :grandmas, :feed_photos, :text, array: true, default: [], using: "(string_to_array(feed_photos, ','))"
  end
end
