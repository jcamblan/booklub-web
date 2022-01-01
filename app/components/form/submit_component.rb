# frozen_string_literal: true

module Form
  class SubmitComponent < ViewComponent::Base
    def initialize(form:, text:)
      @form = form
      @text = text
    end
  end
end
