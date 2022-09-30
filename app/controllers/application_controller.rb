class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_in_path_for(resource)
    if current_user.role == "demandeur"
      demandes_path
    else
      admin_index_path
    end
  end

  private

  def user_not_authorized
    flash[:alert] = "Vous n'êtes pas autorisé à effectuer cette action. Veuillez vous connecter."
    redirect_back(fallback_location: new_user_session_path)
  end
end
