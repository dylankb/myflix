class Video < ActiveRecord::Base
  belongs_to :category
  has_many :reviews, -> { order('created_at DESC') }

  has_many :queue_items

  validates_presence_of :title, :description

  def self.search_by_title(search_term)
    return [] if search_term.blank?
    Video.where("title LIKE ?", "%#{search_term}%").order("created_at DESC")
  end

  def average_rating
    reviews = Review.where(video: self)
    return "No Reviews" if reviews.empty?

    total_reviews = reviews.reduce(0) do |acc, review|
      acc += review.rating
      acc
    end

    (total_reviews / reviews.size.to_f).round(1)
  end
end
