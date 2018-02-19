class ReviewsController < ApplicationController
  def create
    video = Video.find(params[:video_id])
    Review.create(review_params)
    redirect_to video
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
