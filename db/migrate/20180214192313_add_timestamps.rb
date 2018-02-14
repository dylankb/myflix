class AddTimestamps < ActiveRecord::Migration
  def change
    add_timestamps :videos
    add_timestamps :categories
  end
end
