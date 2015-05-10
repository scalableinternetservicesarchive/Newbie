class FavoritePostController < ApplicationController
  def show
    @posts = current_user.favorites
  end
end
