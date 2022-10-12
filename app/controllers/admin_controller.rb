class AdminController < ApplicationController
  before_action :is_user_authorized
  def index
    @demandes = Demande.all
    @districts = Demande.pluck(:district).uniq.sort
    @communes = Demande.pluck(:commune).compact_blank.uniq.sort
    @sous_prefectures = Demande.pluck(:sous_prefecture).compact_blank.uniq.sort

    unless params[:search].blank?
      s = "%#{params[:search]}%"
      @demandes = @demandes.where("demandes.nom ILIKE :search OR demandes.prénom ILIKE :search OR demandes.lieu_naissance ILIKE :search OR demandes.number = :registre", {search: s, registre: params[:search]})
    end

    unless params[:type_document].blank?
      @demandes = @demandes.where("demandes.type_document = ?", params[:type_document])
    end

    unless params[:district].blank?
      @demandes = @demandes.where("demandes.district = ?", params[:district])
      @communes = Demande.where(district: params[:district]).pluck(:commune).compact_blank.uniq.sort
      @sous_prefectures = Demande.where(district: params[:district]).pluck(:sous_prefecture).compact_blank.uniq.sort
    end

    unless params[:commune].blank?
      @demandes = @demandes.where("demandes.commune = ?", params[:commune])
    end

    unless params[:sous_prefecture].blank?
      @demandes = @demandes.where("demandes.sous_prefecture = ?", params[:sous_prefecture])
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
