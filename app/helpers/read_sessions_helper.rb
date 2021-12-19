# frozen_string_literal: true

module ReadSessionsHelper
  def next_session_name(club)
    number = club.read_sessions.count + 1
    t('.next_session_name', number: number)
  end
end
