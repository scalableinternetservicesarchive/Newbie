class IndexController < ApplicationController
  layout 'index'
  def index
    @posts = Post.last(9).reverse
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
