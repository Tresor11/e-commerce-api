class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all
    json_response(@favorites)
  end

  def create
    @favorite = current_user.favorites.create!(favorite_params)
    json_response(@favorite, :created)
  end

  def destroy
    @favorite = Favorite.where(item_id: params[:item_id])[0]
    @favorite.destroy
    head :no_content
  end

  private

  def favorite_params
    params.permit(:item_id)
  end
end
