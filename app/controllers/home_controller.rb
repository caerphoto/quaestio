class HomeController < ApplicationController
  def index
    if user_signed_in?
      @questions = Question.where.not(user_id: current_user.id)
    else
      @questions = Question.all
    end
  end

  def question
    @question = Question.find(question_param)
  end

  private

    def question_param
      params.expect(:id)
    end
end
