# frozen_string_literal: true

class Session < ApplicationRecord
  belongs_to :club
  belongs_to :selected_book, class_name: 'Book', optional: true

  scope :active, -> { where(state: %w[submission draw reading]) }
end

# == Schema Information
#
# Table name: sessions
#
#  id                  :uuid             not null, primary key
#  name                :string
#  next_step_date      :datetime
#  read_due_date       :datetime
#  state               :string
#  submission_due_date :datetime
#  club_id             :uuid             not null
#  selected_book_id    :uuid
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_sessions_on_club_id           (club_id)
#  index_sessions_on_selected_book_id  (selected_book_id)
#
