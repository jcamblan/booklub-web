# frozen_string_literal: true

class StarComponent < ViewComponent::Base
  def initialize(fill: true, size: 14, value: nil, data_note_target: nil)
    @color = fill ? '#FFC41F' : '#EEEEEE'
    @size = size
    @value = value
    @data_note_target = data_note_target
  end
end
