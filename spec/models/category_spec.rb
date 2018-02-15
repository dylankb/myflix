require 'spec_helper'

describe Category do
  it { should have_many(:videos) }

  describe '#recent videos' do
    it 'returns an empty array if there are no category videos' do
      got = Video.create(
        title: 'Game of Thrones',
        description: 'Swords and fighting',
      )

      comedy = Category.create(name: 'Comedy')
      expect(comedy.recent_videos).to eq([])
    end
    it 'returns videos in reverse chronological order' do
      comedy = Category.create(name: 'Comedy')
      the_office = Video.create(
        title: 'The Office',
        description: 'Comedic cartoon',
        category: comedy,
        created_at: 1.day.ago
      )
      family_guy = Video.create(
        title: 'Family Guy',
        description: 'Comedic cartoon',
        category: comedy
      )

      expect(comedy.recent_videos).to eq([family_guy, the_office])
    end

    it 'returns 6 videos if there are more than 6 videos' do
      comedy = Category.create(name: 'Comedy')
      7.times do
        Video.create(
          title: 'Test video',
          description: 'Test description',
          category: comedy
        )
      end

      expect(comedy.recent_videos.count).to eq(6)
    end

    it 'returns the most recent 6 videos' do
      comedy = Category.create(name: 'Comedy')
      7.times do
        Video.create(
          title: 'Test video',
          description: 'Test description',
          category: comedy
        )
      end
      daily_show = Video.create(
        title: 'Daily Show',
        description: 'Satirical news',
        category: comedy,
        created_at: 1.day.ago
      )

      expect(comedy.recent_videos).not_to include(daily_show)
    end
  end
end
