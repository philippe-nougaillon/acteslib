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

  def show_details?
    @user && @user.role_number >= 1
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

  def download?
    @user
  end

  def attente?
    @user && @user.role_number >= 1
  end

  def traiter?
    attente?
  end

  def echec?
    attente?
  end

  def archiver?
    attente?
  end
end
