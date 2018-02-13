class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.string :thumbnail_image_url
      t.string :cover_image_url
    end
  end
end
