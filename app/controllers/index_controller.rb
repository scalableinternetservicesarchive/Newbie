class IndexController < ApplicationController
  def index
    @posts = Post.all
  end

  # Get /search
  def search
    @results = Post.search(params[:search])
  end

  def about
  end

  def contact
  end
end
