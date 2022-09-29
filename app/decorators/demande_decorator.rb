# frozen_string_literal: true

module DemandeDecorator
  def style
    self.current_state.meta[:style]
  end
end
