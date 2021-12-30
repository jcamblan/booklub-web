# frozen_string_literal: true

class StarComponent < ViewComponent::Base
  def initialize(fill: true, size: 14)
    @color = fill ? '#FFC41F' : '#EEEEEE'
    @size = size
  end
end
