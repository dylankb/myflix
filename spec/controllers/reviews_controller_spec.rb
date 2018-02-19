require 'spec_helper'

describe ReviewsController do
  describe 'POST create' do
    context 'with authenticated users' do
      context 'with valid inputs' do
        it 'redirects to the video show page' do
          video = Fabricate(:video)
          post :create, review: Fabricate.attributes_for(:review), video_id: video.id
          expect(response).to redirect_to video
        end
        it 'creates a review' do
          video = Fabricate(:video)
          post :create, review: Fabricate.attributes_for(:review), video_id: video.id
          expect(Review.count).to eq(1)
        end
        it 'creates a review associated with the video' do
          video = Fabricate(:video)
          post :create, review: Fabricate.attributes_for(:review), video_id: video.id
          expect(Review.first.video).to eq(video)
        end
        it 'creates a review associated with the signed in user'

      end
      context 'with invalid inputs' do
      end
    end
    context 'with unauthenticated users' do
    end
  end
end
