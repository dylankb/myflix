require 'spec_helper'

describe QueueItem do
  it { should belong_to(:user) }
  it { should belong_to(:video) }

  describe "#video_title" do
    it "returns the title of the video" do
      video = Fabricate(:video)
      queue_item = Fabricate(:queue_item)
      queue_item.video = video

      expect(queue_item.video_title).to eq(video.title)
    end
  end

  describe "#video_average_rating" do
    it "returns the rating of the video" do
      video = Fabricate(:video)
      queue_item = Fabricate(:queue_item)
      queue_item.video = video

      expect(queue_item.video_average_rating).to eq(video.average_rating)
    end
  end

  describe "#video_category" do
    it "returns the category of the video" do
      video = Fabricate(:video)
      category = Fabricate(:category, name: "Comedy")
      video.category = category
      queue_item = Fabricate(:queue_item)
      queue_item.video = video

      expect(queue_item.video_category_name).to eq("Comedy")
    end
  end
end
