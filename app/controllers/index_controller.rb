class IndexController < ApplicationController
  layout 'index'
  def index
    @posts = Post.includes(:pictures).last(9).reverse
  end

  def about
  end

  def contact
  end
end
