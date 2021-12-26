# frozen_string_literal: true

class Submission < ApplicationRecord
  # == Constants ===============================================================
  # == Attributes ==============================================================
  # == Extensions ==============================================================
  # == Relationships ===========================================================

  belongs_to :read_session, touch: true
  belongs_to :user
  belongs_to :book

  accepts_nested_attributes_for :book

  # == Validations =============================================================

  validates :user_id, uniqueness: { scope: :read_session_id }

  # == Scopes ==================================================================
  # == Callbacks ===============================================================
  # == Class Methods ===========================================================
  # == Instance Methods ========================================================
end

# == Schema Information
#
# Table name: submissions
#
#  id              :uuid             not null, primary key
#  book_id         :uuid             not null
#  read_session_id :uuid             not null
#  user_id         :uuid             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_submissions_on_book_id          (book_id)
#  index_submissions_on_read_session_id  (read_session_id)
#  index_submissions_on_user_id          (user_id)
#
