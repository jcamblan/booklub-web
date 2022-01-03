# frozen_string_literal: true

module Form
  class DateTimeInputComponent < ViewComponent::Base
    def initialize(form:, label:, name:)
      @form = form
      @label = label
      @name = name
    end
  end
end
