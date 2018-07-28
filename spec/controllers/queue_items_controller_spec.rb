require 'spec_helper'

describe QueueItemsController do
  describe 'GET index' do
    it 'sets the @queue_items instance variable' do
      alice = Fabricate(:user)
      session[:user_id] = alice.id
      queue_item1 = Fabricate(:queue_item, user: alice)
      queue_item2 = Fabricate(:queue_item, user: alice)

      get :index
      expect(assigns(:queue_items)).to match_array([queue_item1, queue_item2])
    end

    it 'redirects to the sign in page for unauthenticated users' do
      get :index
      expect(response).to redirect_to sign_in_path
    end
  end

  describe "POST create" do
    let(:video) { Fabricate(:video) }
    let(:alice) { Fabricate(:user) }

    it "redirects to the queue page" do
      session[:user_id] = alice.id
      post :create, queue_item: { video_id: video.id, user_id: alice.id }

      expect(response).to redirect_to queue_path
    end

    it "creates a queue item" do
      session[:user_id] = alice.id
      post :create, queue_item: { video_id: video.id, user_id: alice.id }

      expect(QueueItem.count).to eq(1)
    end

    it "creates a queue item associated with the video" do
      session[:user_id] = alice.id
      post :create, queue_item: { video_id: video.id, user_id: alice.id }

      expect(QueueItem.first.video).to eq(video)
    end

    it "creates a queue item associated with the the signed in user" do
      session[:user_id] = alice.id
      post :create, queue_item: { video_id: video.id, user_id: alice.id }

      expect(QueueItem.first.user).to eq(alice)
    end

    it "puts the video as the last one in the queue" do
      session[:user_id] = alice.id
      video2 = Fabricate(:video, title: "Hook")
      queue_item = Fabricate(:queue_item, video: video2, user: alice, position: 1)

      video.title = "Mulan"
      video.save

      post :create, queue_item: { video_id: video.id, user_id: alice.id }

      expect(alice.queue_items.find_by(position: 2).video_title).to eq("Mulan")
    end

    it "does not add the video to the queue if it's already in the queue" do
      session[:user_id] = alice.id
      video = Fabricate(:video, title: "Mulan")

      queue_item = Fabricate(:queue_item, video: video, user: alice)

      post :create, queue_item: { video_id: video.id, user_id: alice.id }

      expect(alice.queue_items.count).to eq(1)
      expect(alice.queue_items.first).to eq(queue_item)
    end

    it "redirects to the sign in page for unauthenticated users" do
      post :create, queue_item: { video_id: video.id, user_id: 3 }

      expect(response).to redirect_to sign_in_path
    end
  end
end
