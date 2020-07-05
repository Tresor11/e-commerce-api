class ItemsController < ApplicationController
  before_action :require_admin, except: %i[index show]
  before_action :item, only: %i[show update destroy]

  def index
    @items = Item.all.order(created_at: :desc)
    json_response(@items)
  end

  def create
    @item = current_user.items.build(item_params)
    json_response(@item, :created) if @item.save!
  end

  def show
    @liked = current_user.favorites.any? { |el| el.item_id == @item.id }
    @response = {
      item: @item,
      liked: @liked
    }
    json_response(@response)
  end

  def update
    @item.update!(item_params)
    json_response(@item)
  end

  def destroy
    @item.destroy
    head :no_content
  end

  private

  def item_params
    params.permit(:name, :description, :price, :contact, :image)
  end

  def require_admin
    raise(ExceptionHandler::InvalidToken, Message.no_admin) unless current_user.admin
  end

  def item
    @item = Item.find(params[:id])
  end
end
