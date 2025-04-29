require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  INVALID_VERIFICATION_ID = -999

  test "only valid verification methods are allowed" do
    valid_ids = User::VERIFICATION_METHODS
    u = User.new
    assert(u.verify(valid_ids.first[:id]))
    assert_raises(InvalidVerificationMethodError) do
      u.verify!(INVALID_VERIFICATION_ID)
    end
  end
end
