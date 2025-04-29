class HomeController < ApplicationController
  def index
    if user_signed_in?
      @questions = Question.where.not(user_id: current_user.id)
    else
      @questions = Question.all
    end
  end
end
