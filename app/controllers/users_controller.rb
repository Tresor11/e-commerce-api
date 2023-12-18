class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create
  def create
    user = User.new(user_params)
    user.save!
    UserMailer.with(user:).welcome_email.deliver_now
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = { message: Message.account_created, auth_token: }
    json_response(response, :created)
  end

  def update
    current_user.update!(user_params)
    json_response(current_user)
  end

  def show
    @result = ''
    if current_user.admin?
      @result = admin_profile
    else
      @favorites = current_user.favorites.preload(:item)
      @result = user_profile(@favorites)
    end
    json_response(@result)
  end

  private

  def admin_profile
    liked = Item.favorited(current_user)
    income = liked.sum(&:price)
    {
      details: current_user,
      liked:,
      income:
    }
  end

  def user_profile(favorites)
    items = favorites.collect(&:item)
    expense = items.sum(&:price)
    {
      details: current_user,
      favorites: items,
      expense:
    }
  end

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
