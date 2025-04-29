class Question < ApplicationRecord
  belongs_to :user
  has_one :category
  has_many :answers
end
