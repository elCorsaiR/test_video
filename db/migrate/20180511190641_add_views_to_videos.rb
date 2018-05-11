class AddViewsToVideos < ActiveRecord::Migration[5.0]
  def change
    add_column :videos, :views, :integer, default: 0
  end
end
