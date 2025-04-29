class Payment < ApplicationRecord
  belongs_to :answer
  has_one :user, through: :answer
end
