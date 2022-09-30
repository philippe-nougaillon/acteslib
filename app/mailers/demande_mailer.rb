class DemandeMailer < ApplicationMailer
  def new_demande
    @demande = params[:demande]
    mail(to: "test@gmail.com", subject: 'Nouvelle demande')
  end
end
