require 'spec_helper'

describe VideosController do
  describe 'GET index' do
    it 'sets @categories for authenticated user' do
      session[:user_id] = Fabricate(:user).id
      category = Fabricate(:category)
      get :index

      expect(assigns(:categories)).to eq([category])
    end
  end

  describe 'GET show' do
    context 'with authenticated user' do
      before do
        session[:user_id] = Fabricate(:user).id
      end

      it 'sets @video' do
        video = Fabricate(:video)
        get :show, id: video.id
        expect(assigns(:video)).to eq(video)
      end

      it 'sets @reviews' do
        video = Fabricate(:video)
        review1 = Fabricate(:review, video: video)
        review2 = Fabricate(:review, video: video)
        reviews = [review1, review2]
        reviews.sort!

        get :show, id: video.id

        expect(assigns(:reviews)).to match_array([review1, review2])
      end
    end

    context 'with unauthenticated user' do
      it 'redirects user to the sign in page' do
        video = Fabricate(:video)
        get :show, id: video.id
        expect(response).to redirect_to sign_in_path
      end
    end
  end

  describe 'POST search' do
    it 'rests @results for authenticated users' do
      session[:user_id] = Fabricate(:user).id # "flatter" test with no context
      the_office = Fabricate(:video, title: 'The Office')
      get :search, search_term: 'The'

      expect(assigns(:results)).to eq([the_office])
    end

    it 'redirects to sign in page for the unauthenticated users' do
      get :search, search_term: 'The'

      expect(response).to redirect_to sign_in_path
    end
  end
end
