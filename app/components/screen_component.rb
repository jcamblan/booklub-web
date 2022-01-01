# frozen_string_literal: true

class ScreenComponent < ViewComponent::Base
  def initialize(title: nil, back_path: nil, modal_toggler: false)
    @back_path = back_path
    @title = title
    @modal_toggler = modal_toggler
  end
end
