class QuizController < ApplicationController
	before_filter :require_user

  def index
    if current_user.verified?
      flash[:alert] = "You've already passed the quiz!  You're all set."
      redirect_to root_path
    end
		@questions = Quiz::questions
		@choices = Quiz::choices
  end
  
  # This is where you will process the results
  def grade
  	quiz = Quiz.new(params[:quiz])
  	score_info = quiz.grade.map { |x| x.to_i }
    session[:grade] = score_info
  	current_user.update_attribute(:verified, quiz.passed?)
    if quiz.passed?
      check_retailer_status(current_user)
      RetailerMailer.pass_quiz_email(current_user).deliver
    end
    @wrong_answers = []
    score_info.each { |i| @wrong_answers << Quiz::questions[i] }
    session[:answers] = @wrong_answers
  end

  protected

  def check_retailer_status(user)
    users = User.where(:retailer_id => user.retailer_id).where(:verified => false)
    if users.count >= 1
      return
    else
      RetailerMailer.all_accounts_verified(user).deliver
    end
  end

end
