# frozen_string_literal: true

module Form
  class ErrorChunkComponent < ViewComponent::Base
    def initialize(errors:)
      @errors = errors
    end
  end
end
