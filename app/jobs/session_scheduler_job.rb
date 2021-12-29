# frozen_string_literal: true

class SessionSchedulerJob < ApplicationJob
  queue_as :default

  def perform
    ReadSession.where(state: :submission)
               .where('submission_due_date < ?', Time.zone.now)
               .find_each(&:start_draw!)

    ReadSession.where(state: :reading)
               .where('read_due_date < ?', Time.zone.now)
               .find_each(&:conclude!)
  end
end
