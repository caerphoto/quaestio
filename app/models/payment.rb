class Payment < ApplicationRecord
  has_one :answer
  has_one :user, through: :answer
  has_one :question, through: :answer
end
