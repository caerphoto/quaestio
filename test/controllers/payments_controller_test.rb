require "test_helper"

class PaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payment = payments(:one)
  end

  test "should update payment" do
    patch payment_url(@payment), params: { payment: { approved: true } }
    assert_redirected_to question_url(@payment.question)
  end
end
