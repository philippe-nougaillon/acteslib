class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    if current_user.role == "demandeur"
      demandes_path
    else
      admin_index_path
    end
    
  end
end
