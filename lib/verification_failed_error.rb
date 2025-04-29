class VerificationFailedError < StandardError
  attr_reader :verification_method_id

  def initialize(verification_method_id)
    @verification_method_id = verification_method_id
    super
  end
end
