class AddCategoryIdToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :category_id, :integer, null: false
  end
end
