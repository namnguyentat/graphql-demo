class BookPolicy < ApplicationPolicy
  def index?
    return true if user.present?
    unauthorized!
  end

  def show?
    return true if user.present? && resource.present?
    unauthorized!
  end

  def create?
    return true if user.present?
    unauthorized!
  end

  def update?
    return true if user.present? && resource.present? && resource.user_id == user.id
    unauthorized!
  end
end
