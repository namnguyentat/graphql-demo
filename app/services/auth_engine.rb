class AuthEngine
  attr_reader :request, :current_user

  def initialize(request:, current_user:)
    @request = request
    @current_user = current_user
  end

  def authenticate!
    raise UnauthenticatedError if current_user.nil?
  end

  def authorize!(policy_class:, action:, resource: nil, context: nil)
    policy_class.new(current_user, resource, context, action).send(action)
  end
end
