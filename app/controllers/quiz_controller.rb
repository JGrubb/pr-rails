class QuizController < ApplicationController
	before_filter :require_user

  def index
		@questions = Quiz::questions
		@choices = Quiz::choices
  end
  
  # This is where you will process the results
  def grade
  	quiz = Quiz.new(params[:quiz])
  	score_info = quiz.grade
    session[:grade] = Quiz::questions
  	current_user.update_attribute(:verified, quiz.passed?)
    @wrong_answers = Quiz::questions.keys.to_a - score_info.to_a
  end
end
