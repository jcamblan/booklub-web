# frozen_string_literal: true

module ClubsHelper
  def club_sessions_count(club, user)
    club.read_sessions.joins(:users).where(users: { id: user.id }).count
  end
end
