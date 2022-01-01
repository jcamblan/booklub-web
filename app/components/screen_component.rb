# frozen_string_literal: true

class ScreenComponent < ViewComponent::Base
  def initialize(title:, back_path: nil, settings_component: nil)
    @back_path = back_path
    @title = title
    @settings_component = settings_component
  end
end
