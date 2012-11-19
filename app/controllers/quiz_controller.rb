class QuizController < ApplicationController
	before_filter :require_user

  def index
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
      PassQuiz.pass_quiz_email(current_user).deliver
    end
    @wrong_answers = []
    score_info.each { |i| @wrong_answers << Quiz::questions[i] }
    session[:answers] = @wrong_answers
  end
end
