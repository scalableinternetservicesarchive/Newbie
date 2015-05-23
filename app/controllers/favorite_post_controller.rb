class FavoritePostController < ApplicationController
  def show
    @posts = current_user.favorites.paginate(:page =>params[:page], :per_page => 5).eager_load(:comments,:favorite_posts,:pictures)
  end
end
