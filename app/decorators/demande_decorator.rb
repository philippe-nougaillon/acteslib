# frozen_string_literal: true

module DemandeDecorator
  def style
    self.current_state.meta[:style]
  end

  def districts
    ['Abidjan', 'Bas-Sassandra', 'Comoé', 'Denguélé', 'Gôh-Djiboua', 'Lacs', 'Lagunes', 'Montagnes', 'Sassandra-Marahoué', 'Savanes', 'Vallée du Bandama', 'Woroba', 'Yamoussoukro', 'Zanzan']
  end

end
