class VideosController < ApplicationController

  def index
    @categories = Category.all
  end

end
