class DemandeMailer < ApplicationMailer
  def new_demande
    @demande = params[:demande]
    mail(to: "p-edacquet@hotmail.fr, philippe.nougaillon@gmail.com, benidag@gmail.com", subject: 'Nouvelle demande')
  end

  def demande_updated
    @demande = params[:demande]
    mail(to: "p-edacquet@hotmail.fr, philippe.nougaillon@gmail.com, benidag@gmail.com", subject: 'Demande modifiée')
  end
end
