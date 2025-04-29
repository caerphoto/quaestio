class Question < ApplicationRecord
  belongs_to :user, optional: true # user accounts can be deleted, leaving anonymous questions
  has_one :category
  has_many :answers

  def approved_answers
    answers
      .joins(:payment)
      .joins(:user)
      .select("answers.body, users.name AS user_name")
      .where("payment.approved" => true)
  end

  def proposed_answers
    answers
      .joins(:payment)
      .joins(:user)
      .select("payment.amount AS payment_amount, users.name as user_name")
      .where("payment.approved" => false)
  end
end
