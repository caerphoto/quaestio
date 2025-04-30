class HomeController < ApplicationController
  def index
    if user_signed_in?
      @questions = Question.where.not(user_id: current_user.id).order(created_at: :desc)
    else
      @questions = Question.all.order(created_at: :desc)
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
