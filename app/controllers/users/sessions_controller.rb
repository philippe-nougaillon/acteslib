# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    if user_signed_in?
      if current_user.role == 'demandeur'
        redirect_to pages_welcome_path, notice: 'Bienvenue'
      else
        redirect_to admin_index_path, notice: 'Bienvenue ! Content de vous revoir...'
      end
    else
      redirect_to new_user_session_path, alert: "Identifiant et/ou mot de passe invalide"
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
