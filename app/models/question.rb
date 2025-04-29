class Question < ApplicationRecord
  belongs_to :user, optional: true # user accounts can be deleted, leaving anonymous questions
  has_one :category
  has_many :answers
end
