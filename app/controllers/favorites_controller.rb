# frozen_string_literal: true

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
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    head :no_content
  end

  private

  def favorite_params
    params.permit(:item_id)
  end
end
