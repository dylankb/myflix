class VideosController < ApplicationController

  def index
    @categories = Category.all
  end

  def search
    @results = Video.search_by_title(params[:search_term])
  end
end
