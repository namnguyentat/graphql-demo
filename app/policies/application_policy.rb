class ApplicationPolicy
  attr_reader :user, :resource, :context, :action

  def initialize(user, resource, context, action)
    @user = user
    @resource = resource
    @context = context
    @action = action
  end

  protected

  def unauthorized!
    raise ::Pundit::NotAuthorizedError, query: action, record: resource
  end
end
