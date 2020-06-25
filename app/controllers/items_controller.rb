# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :require_admin

  skip_before_action :require_admin, only: %i[index show]

  def index
    @items = Item.all
    json_response(@items)
  end

  def create
    @item = current_user.items.build(item_params)
    json_response(@item, :created) if @item.save!
  end

  def show
    @item = Item.find(params[:id])
    @liked = current_user.favorites.include?(@item)
    @response = {
      item: @item,
      liked: @liked
    }
    json_response(@response)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    head :no_content
  end

  private

  def item_params
    params.permit(:name, :description, :price, :contact, :image)
  end

  def require_admin
    unless current_user.admin
      raise(ExceptionHandler::InvalidToken, Message.no_admin)
    end
  end
end
