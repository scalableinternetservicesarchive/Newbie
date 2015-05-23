class IndexController < ApplicationController
  layout 'index'
  def index
    @posts = Post.eager_load(:pictures).last(9).reverse
  end

  def about
  end

  def contact
  end
end
