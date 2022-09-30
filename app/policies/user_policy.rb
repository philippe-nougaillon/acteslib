class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    @user && @user.administrateur?
  end

  def show?
    index?
  end

  def create?
    index?
  end

  def new?
    create?
  end

  def edit?
    index?
  end

  def update?
    edit?
  end

  def destroy?
    index?
  end
end
