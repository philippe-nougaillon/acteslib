class PagesController < ApplicationController
  def welcome
    @demandes = current_user.demandes
  end
end
