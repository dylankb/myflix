require 'spec_helper'

describe Category do
  it 'can save' do
    category = Category.new(name: 'Comedy')
    category.save
    expect(Category.first).to eq(category)
  end

  it 'has many videos' do
    commedy = Category.create(name: 'Comedy')
    the_office = Video.create(title: 'The Office', category: commedy)
    family_guy = Video.create(title: 'Family Guy', category: commedy)
    expect(commedy.videos).to include(the_office, family_guy)
  end

  it 'has videos ordered by title' do
    commedy = Category.create(name: 'Comedy')
    the_office = Video.create(title: 'The Office', category: commedy)
    family_guy = Video.create(title: 'Family Guy', category: commedy)
    expect(commedy.videos).not_to eq([the_office, family_guy])
    expect(commedy.videos).to eq([family_guy, the_office])
  end
end
