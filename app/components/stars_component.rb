# frozen_string_literal: true

class StarsComponent < ViewComponent::Base
  def initialize(note:)
    @note = note || 0
  end
end
