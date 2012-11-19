class PassQuiz < ActionMailer::Base
  default from: "mailman@plantright.org"

  def pass_quiz_email(user)
    mail(:to => user.email, :subject => "Congratulations, you passed PlantRight 101!")
  end

end
