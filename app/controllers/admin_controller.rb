class AdminController < ApplicationController
  def index
    @demandes = Demande.all

    unless params[:demande].blank?
      s = "%#{params[:demande]}%"
      @demandes = @demandes.where("demandes.type_document = ?", params[:demande])
    end

    if (!params[:du].blank? && !params[:au].blank?)
      @demandes = @demandes.where("DATE(demandes.created_at) BETWEEN ? AND ?", params[:du], params[:au])
    end

    @demandes = @demandes.page(params[:page])
  end
end
