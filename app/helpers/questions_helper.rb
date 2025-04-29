module QuestionsHelper
  def status_class(question)
    text = ""
    if question.open
      text += " open"
    else
      text += " closed"
    end

    text += " answered" unless question.answers.empty?
    text
  end
end
