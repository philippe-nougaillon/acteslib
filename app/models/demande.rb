class Demande < ApplicationRecord
  audited
  include Workflow
  include WorkflowActiverecord

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged


  has_one_attached :document_aller
  has_one_attached :document_retour
  belongs_to :user

  enum type_document: { Naissance: 1, Copie_intégrale: 2, Décès: 3 }

  validates :type_document, :nom, :prénom, :date_naissance, :lieu_naissance, :district, :workflow_state, presence: true

  #after_create :send_new_demande_notification_to_user
  #before_update :send_update_demande_notification_to_demandeur, :if => proc { workflow_state_was && workflow_state_changed? }

  paginates_per 20

  default_scope {order 'updated_at DESC'}

  # scope :publié, -> { where(workflow_state: PUBLIE )}

  # WORKFLOW
  NOUVELLE = 'nouvelle'
  ATTENTE  = 'attente'
  TRAITEE  = 'traitée'
  ECHEC    = 'echec'
  ARCHIVEE = 'archivée'

  workflow do
    state NOUVELLE, meta: { style: 'secondary' } do
      event :attente, transitions_to: ATTENTE
      event :traiter, transitions_to: TRAITEE
      event :echec, transitions_to: ECHEC
    end

    state ATTENTE, meta: { style: 'warning' } do
      event :traiter, transitions_to: TRAITEE
      event :echec, transitions_to: ECHEC
    end

    state TRAITEE, meta: { style: 'success' } do 
      event :archiver, transitions_to: ARCHIVEE
    end

    state ECHEC, meta: { style: 'error' } do 
      event :archiver, transitions_to: ARCHIVEE
    end

    state ARCHIVEE, meta: { style: 'info' }
  end

  # pour que le changement se voit dans l'audit trail
  def persist_workflow_state(new_value)
    self[:workflow_state] = new_value
    save!
  end

  private

  def send_new_demande_notification_to_user
    DemandeMailer.with(demande: self).new_demande.deliver_now
  end

  def send_update_demande_notification_to_demandeur
    DemandeMailer.with(demande: self).demande_updated.deliver_now
  end

  # only one candidate for an nice id; one random UDID
  def slug_candidates
    [SecureRandom.uuid]
  end
end