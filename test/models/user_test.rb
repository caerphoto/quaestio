require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  INVALID_VERIFICATION_ID = -999

  test "only valid verification methods are allowed" do
    valid_ids = User::VERIFICATION_METHODS
    u = users(:one)
    assert(u.verify(valid_ids.first[:id]))
    assert_raises(InvalidVerificationMethodError) do
      u.verify!(INVALID_VERIFICATION_ID)
    end
  end

  test "user cannot answer their own questions" do
    u = users(:one)
    q = Question.new(
      user_id: u.id,
      title: "Test",
      body: "test?",
      category_id: categories(:one).id
    )
    assert_not(u.can_answer?(q))
  end
end
