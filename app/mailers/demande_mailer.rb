class DemandeMailer < ApplicationMailer
  def new_demande
    @demande = params[:demande]
    mail(to: "test@gmail.com", subject: 'Nouvelle demande')
  end

  def demande_updated
    @demande = params[:demande]
    mail(to: @demande.user, subject: 'Nouvelle demande')
  end
end
