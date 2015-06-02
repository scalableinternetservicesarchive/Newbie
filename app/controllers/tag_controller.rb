class TagController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @posts = Post.tagged_with(@tag.name).paginate(:page =>params[:page], :per_page => 5).eager_load(:comments,:favorite_posts,:pictures)
    fresh_when([@posts, Comment.all, FavoritePost.all, current_user, alert, notice])
  end
end
