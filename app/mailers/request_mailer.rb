class RequestMailer < ApplicationMailer
  default from: 'nomimatch_norification@gmail.com'
  
  def request_email
    @user = params[:user]
    @request = params[:request]
    mail(to: @user.email, subject: "#{@user.name}さん宛に飲み会依頼が届きました！")
  end
end