class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user, optional: true # user accounts can be deleted, leaving anonymous answers
  belongs_to :payment
end
