class IndexController < ApplicationController
  def index
    @posts = Post.order(:datetime)
  end

  # Get /search
  def search
    @posts = Post.search(params[:search])
    @keyword = params[:search]
  end

  def about
  end

  def contact
  end
end
