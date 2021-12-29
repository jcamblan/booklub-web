# frozen_string_literal: true

Dir.glob(Rails.root.join('db/seeds/*.rb')).each { |seed| load(seed) }
