class RetailerMailer < ActionMailer::Base
  default from: "PlantRight@plantright.org"

  def pass_quiz_email(user)
    mail(:to => user.email, :subject => "Congratulations, you passed PlantRight 101!")
  end

  def after_confirm(user)
    @user = user
    mail(:to => user.email, :subject => "PlantRight 101 registration - CONFIRMED")
  end

end
