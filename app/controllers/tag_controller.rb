class TagController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @posts = Post.tagged_with(@tag.name).paginate(:page =>params[:page], :per_page => 5).includes(:comments,:favorite_posts,:pictures)
  end
end
