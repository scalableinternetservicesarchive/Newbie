class FavoritePostController < ApplicationController
  def show
    if stale?([Comment.all, FavoritePost.all, current_user, current_user.favorites, alert, notice])
      @posts = current_user.favorites.paginate(:page =>params[:page], :per_page => 5).eager_load(:comments,:favorite_posts,:pictures)
    end
  end
end
