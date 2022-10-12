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
    when "nouvelle"
      2
    when "attente"
      3
    else
      4
    end
  end

  def districts
    ['Abidjan', 'Bas-Sassandra', 'Comoé', 'Denguélé', 'Gôh-Djiboua', 'Lacs', 'Lagunes', 'Montagnes', 'Sassandra-Marahoué', 'Savanes', 'Vallée du Bandama', 'Woroba', 'Yamoussoukro', 'Zanzan']
  end

end
