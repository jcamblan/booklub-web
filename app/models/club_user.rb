# frozen_string_literal: true

class ClubUser < ApplicationRecord
  # == Constants ===============================================================
  # == Attributes ==============================================================
  # == Extensions ==============================================================
  # == Relationships ===========================================================

  belongs_to :user
  belongs_to :club

  # == Validations =============================================================

  validates :club_id, uniqueness: { scope: :user_id }

  # == Scopes ==================================================================
  # == Callbacks ===============================================================
  # == Class Methods ===========================================================
  # == Instance Methods ========================================================

  def submissions
    user.submissions.where_assoc_exists(:read_session, club: club)
  end

  # bonus_score is a bad luck protection
  # each non selected user submission in a club session grant him 1 point
  # score drop to 0 when the user submission is selected in a draw
  def calculate_score
    score = 0

    submissions.where_assoc_exists(:read_session, state: %w[reading conclusion archived])
               .order(created_at: :asc).each do |submission|
      score += 1
      next unless submission.book_id == submission.read_session.selected_book_id

      score = 0
    end

    score
  end

  # how many sessions did the user participated in?
  def calculate_session_count
    submissions.count
  end

  # how many times did the user submissions were selected?
  def calculate_selection_count
    submissions.count { _1.book_id == _1.read_session.selected_book_id }
  end

  def refresh_stats
    update(
      bonus_score: calculate_score,
      selection_count: calculate_selection_count,
      session_count: calculate_session_count
    )
  end
end

# == Schema Information
#
# Table name: club_users
#
#  id              :uuid             not null, primary key
#  user_id         :uuid             not null
#  club_id         :uuid             not null
#  session_count   :integer          default("0"), not null
#  selection_count :integer          default("0"), not null
#  bonus_score     :integer          default("0"), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_club_users_on_club_id  (club_id)
#  index_club_users_on_user_id  (user_id)
#
