# frozen_string_literal: true

class SessionDrawJob < ApplicationJob
  queue_as :default

  def perform(read_session_id)
    read_session = ReadSession.find(read_session_id)
    elected_book_id = draw_book_from(read_session)
    read_session.update(selected_book_id: elected_book_id)
    read_session.start_reading!
    refresh_users_scores_from(read_session)
  end

  private

  def draw_book_from(read_session)
    pool = []

    # user score increase his books chances to be selected
    read_session.submissions.each do |submission|
      score = ClubUser.find_by(
        club: read_session.club, user: submission.user
      )&.bonus_score || 0

      score.times do
        pool << submission.book_id
      end
    end

    pool.sample
  end

  def refresh_users_scores_from(read_session)
    ClubUser.joins(user: :submissions)
            .where(submissions: { read_session_id: read_session.id })
            .find_each(&:refresh_stats)
  end
end
