# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create
  def create
    user = User.new(user_params)
    user.admin = true if ['tresor.moise2001@gmail.com',"a@gmail.com"].include?(user.email)
    user.save!
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  def update
    current_user.update!(user_params)
    json_response(current_user)
  end

  def show
    @result = ''
    if current_user.admin?
      @items = Item.all
      @liked = @items.reject { |el| el.favorites.empty? }
      @income = @liked.sum(&:price)
      @result = {
        details: current_user,
        liked: @liked,
        income: @income
      }
    else
      @favorites = current_user.favorites.preload(:item)
      @items = @favorites.collect(&:item)
      @expense = @items.sum(&:price)
      @result = {
        details: current_user,
        favorites: @items,
        expense: @expense
      }
    end
    json_response(@result)
  end

  private

  def user_params
    params.permit(
      :name,
      :email,
      :password,
      :password_confirmation,
      :image
    )
  end
end
