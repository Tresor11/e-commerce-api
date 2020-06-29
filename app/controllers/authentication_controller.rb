class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate
  def authenticate
    puts "====================auth_params:=>#{auth_params}==========================="
    auth_token = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    puts "====================auth_token::::::::::=>#{auth_token}==========================="
    json_response(auth_token: auth_token)
  end

  private

  def auth_params
    params.permit(:email, :password, :authentication)
  end
end
