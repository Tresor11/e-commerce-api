class UserMailer < ApplicationMailer
  default from: 'tresor.moise2001@gmail.com'
  def welcome_email
    @user = params[:user]
    @url = 'https://https://resell-app.netlify.app/'
    mail(to: @user.email, subject: 'Welcome To ReselA')
  end
end
