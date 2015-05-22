class FavoritePostController < ApplicationController
  def show
    @posts = current_user.favorites.includes(:comments,:favorite_posts,:pictures)
  end
end
