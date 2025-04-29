class User < ApplicationRecord
  # Note: these would realistically be stored in the database
  VERIFICATION_METHODS = [
    { id: 0, name: "Trust me bro" },
    { id: 1, name: "Pinky swear" },
    { id: 2, name: "On my honour" }
  ].freeze

  has_many :questions
  has_many :answers
  has_many :payments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include RoleModel
  roles :lawyer, :admin, prefix: "is_", dynamic: false

  def verify(ver_id)
    return false unless valid_verification_method?(ver_id)

    roles.add(:lawyer)
  end

  def verify!(ver_id)
    raise InvalidVerificationMethodError.new(ver_id) unless valid_verification_method?(ver_id)
    raise VerificationFailedError.new(ver_id) unless verify(ver_id)
    save!
  end

  def can_answer?(question)
    has_role?(:lawyer) && id != question.id
  end

  private

    def valid_verification_method?(ver_id)
      VERIFICATION_METHODS.map { |m| m[:id] }.include?(ver_id)
    end
end
