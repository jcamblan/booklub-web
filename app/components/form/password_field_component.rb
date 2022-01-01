# frozen_string_literal: true

module Form
  class PasswordFieldComponent < ViewComponent::Base
    def initialize(form:, label:, name:, default_value: nil, id: nil)
      @form = form
      @default_value = default_value || ''
      @id = id || name
      @label = label
      @name = name
    end
  end
end
