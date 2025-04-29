class Question < ApplicationRecord
  belongs_to :user, optional: true # user accounts can be deleted, leaving anonymous questions
  belongs_to :category
  has_many :answers
  has_many :payments, through: :answers

  def approved_answers
    payments.where(approved: true).map { |p| p.answer }
  end

  def proposed_answers
    payments.where(approved: false).map { |p| p.answer }
  end
end
