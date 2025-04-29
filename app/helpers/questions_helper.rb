module QuestionsHelper
  def status_class(question)
    text = ""
    if question.open
      text += " open"
    else
      text += " closed"
    end

    text += " own-question" if user_signed_in? && current_user.id == question.user_id

    text += " answered" unless question.answers.empty?
    text
  end
end
