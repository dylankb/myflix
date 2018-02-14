require 'spec_helper'

describe Video do
  it 'should be able to save' do
    video = Video.new(title: 'New video')
    video.save
    Video.first.title.should == video.title
  end

  it 'belongs to one category' do
    scifi = Category.new(name: 'Science Fiction & Fantasy')
    got = Video.new(title: 'Game of Thrones', category: scifi)
    expect(got.category).to eq(scifi)
  end
end
