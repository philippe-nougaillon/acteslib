class DemandePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    @user
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
    @user && @user.role_number >= 1
  end

  def update?
    edit?
  end

  def destroy?
    @user && @user.administrateur?
  end
end
