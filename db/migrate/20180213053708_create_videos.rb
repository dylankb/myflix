class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :description
      t.string :thumbnail_url
      t.string :image_url
    end
  end
end
