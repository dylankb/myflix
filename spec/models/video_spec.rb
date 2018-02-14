require 'spec_helper'

describe Video do
  it { should belong_to(:category) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }

  describe 'search by title' do
    it "returns an empty array if no results found" do
      got = Video.create(
        title: 'Game of Thrones',
        description: "Swords and fighting"
      )
      family_guy = Video.create(
        title: 'Family Guy',
        description: "Comedic cartoon"
      )
      search_result = Video.search_by_title('z')


      expect(search_result).to eq([])

    end

    it "returns an array for an exact match" do
      got = Video.create(
        title: 'Game of Thrones',
        description: "Swords and fighting"
      )
      family_guy = Video.create(
        title: 'Family Guy',
        description: "Comedic cartoon"
      )

      search_result = Video.search_by_title('Game of Thrones')
      expect(search_result).to eq([got])
    end

    it "returns an array for a partial match" do
      got = Video.create(
        title: 'Game of Thrones',
        description: "Swords and fighting"
      )
      family_guy = Video.create(
        title: 'Family Guy',
        description: "Comedic cartoon"
      )

      search_result = Video.search_by_title('Game')
      expect(search_result).to eq([got])
    end

    it "returns an array of all matches ordered by created_at" do
      got = Video.create(
        title: 'Game of Thrones',
        description: "Swords and fighting",
        created_at: 1.day.ago
      )
      family_guy = Video.create(
        title: 'Family Guy',
        description: "Comedic cartoon"
      )

      search_result = Video.search_by_title('G')
      expect(search_result).to eq([family_guy, got])
    end

    it "returns an empty array if the search string is blank" do
      got = Video.create(
        title: 'Game of Thrones',
        description: "Swords and fighting",
        created_at: 1.day.ago
      )
      family_guy = Video.create(
        title: 'Family Guy',
        description: "Comedic cartoon"
      )

      search_result = Video.search_by_title('')
      expect(search_result).to eq([])
    end
  end
end
