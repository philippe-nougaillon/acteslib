# frozen_string_literal: true

module DemandeDecorator
  def style
    self.current_state.meta[:style]
  end

  def commune_sous_préfecture
    unless self.commune.blank?
      self.commune
    else
      self.sous_préfecture
    end
  end

  def step
    case self.workflow_state
    when "nouvelle", "attente"
      3
    else
      4
    end
  end

  def districts
    ['Abidjan', 'Bas-Sassandra', 'Comoé', 'Denguélé', 'Gôh-Djiboua', 'Lacs', 'Lagunes', 'Montagnes', 'Sassandra-Marahoué', 'Savanes', 'Vallée du Bandama', 'Woroba', 'Yamoussoukro', 'Zanzan']
  end

  def communes_gôh_djiboua
    ['Akridou-Laddé', 'Bayota', 'Brihiri', 'Broudoukou-Penda', 'Chiépo', 'Dahiépa-Kéhi', 'Dairo-Didizo', 'Dakouritrohoin', 'Didoko', 'Diégonéfla', 'Dignago', 'Divo', 'Djidji', 'Dougroupalégnoa', 'Doukouya', 'Doukouyo', 'Dousséba', 'Dribouo', 'Gabia', 'Galébouo', 'Gbadjié', 'Gnagbodougnoa', 'Gnakouboué', 'Godélilié 1', 'Godiéko', 'Gogné', 'Goudi', 'Goudouko', 'Gragba-Dagolilié', 'Grobiakoko', 'Guépahouo', 'Guibéroua', 'Hermankono-Diès', 'Hermankono-Garo', 'Hiré', 'Iroporia', 'Kadéko', 'Kosséhoa', 'Kouaméfla', 'Kpapékou', 'Kreuzoukoué', 'Lagaze', 'Lahouda', 'Lakota', 'Lauzoua', 'Ligrohoin', 'Mabouo', 'Maguéhio', 'Néko', 'Niakoblognoa', 'Niambézaria', 'Niazaroko', 'Ogoudou', 'Ouaragahio', 'Oumé', 'Satroko', 'Serihio', 'Tabléguikou', 'Téhiri', 'Tiégba', 'Tonla', 'Toutoubré', 'Yocoboué', 'Yopohoué', 'Yopohué', 'Zégo', 'Zialégréhoa', 'Ziki-Diès', 'Zikisso']
  end

end
