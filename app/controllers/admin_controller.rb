class AdminController < ApplicationController
  before_action :is_user_authorized
  def index
    @demandes = Demande.all

    unless params[:search].blank?
      s = "%#{params[:search]}%"
      @demandes = @demandes.where("demandes.nom ILIKE :search OR demandes.prénom ILIKE :search OR demandes.lieu_naissance ILIKE :search", {search: s})
    end

    unless params[:type_document].blank?
      @demandes = @demandes.where("demandes.type_document = ?", params[:type_document])
    end

    unless params[:district].blank?
      @demandes = @demandes.where("demandes.district = ?", params[:district])
    end

    unless params[:workflow_state].blank?
      @demandes = @demandes.where("demandes.workflow_state = ?", params[:workflow_state])
    end

    @demandes = @demandes.page(params[:page])
  end

  private

  def is_user_authorized
    authorize :admin
  end
end
