class QueueItem < ActiveRecord::Base
  belongs_to :video
  belongs_to :user

  delegate :average_rating, to: :video, prefix: true
  delegate :title, to: :video, prefix: true

  delegate :category, to: :video
  delegate :name, to: :category, prefix: :video_category
end
