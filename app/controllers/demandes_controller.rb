class DemandesController < ApplicationController
  before_action :set_demande, only: %i[ show edit update destroy download attente traiter echec archiver]
  before_action :is_user_authorized

  # GET /demandes or /demandes.json
  def index
    case current_user.role
    when "demandeur"
      @demandes = current_user.demandes

    when "utilisateur"
      @demandes = Demande.all

    when "institution"
      @demandes = Demande.all

    when "administrateur"
      @demandes = Demande.all
    end
  end

  # GET /demandes/1 or /demandes/1.json
  def show
  end

  def download
    doc = @demande.document_retour
    send_data doc.download, filename: doc.filename.to_s, content_type: doc.content_type
  end

  # GET /demandes/new
  def new
    @demande = Demande.new
  end

  # GET /demandes/1/edit
  def edit
  end

  # POST /demandes or /demandes.json
  def create
    @demande = Demande.new(demande_params)
    @demande.user = current_user

    respond_to do |format|
      if @demande.save
        format.html { redirect_to current_user.demandeur? ? pages_welcome_path : demande_url(@demande), notice: "Votre demande a bien été créée. Le service concerné va traiter votre demande." }
        format.json { render :show, status: :created, location: @demande }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @demande.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /demandes/1 or /demandes/1.json
  def update
    respond_to do |format|
      if @demande.update(demande_params)
        format.html { redirect_to demande_url(@demande), notice: "Demande modifiée." }
        format.json { render :show, status: :ok, location: @demande }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @demande.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /demandes/1 or /demandes/1.json
  def destroy
    @demande.destroy

    respond_to do |format|
      format.html { redirect_to admin_index_path, notice: "Demande supprimée." }
      format.json { head :no_content }
    end
  end

  # WORKFLOW

  def attente
    @demande.attente!
    redirect_to admin_index_path, notice: "Demande mise en attente."
  end

  def traiter
    @demande.traiter!
    redirect_to admin_index_path, notice: "Demande traitée."
  end

  def echec
    @demande.echec!
    redirect_to admin_index_path, notice: "Demande mise en échec."
  end

  def archiver
    @demande.archiver!
    redirect_to admin_index_path, notice: "Demande archivée."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_demande
      @demande = Demande.friendly.find_by_slug(params[:slug])
    end

    # Only allow a list of trusted parameters through.
    def demande_params
      params.require(:demande).permit(:type_document, :nom, :prénom, :date_naissance, :lieu_naissance, :district, :workflow_state, :document_aller, :document_retour, :sous_préfecture, :commune, :numéro_registre, :date_registre, :observation)
    end

    def is_user_authorized
      authorize Demande
    end
end
