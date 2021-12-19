# frozen_string_literal: true

class Submission < ApplicationRecord
  belongs_to :book
  belongs_to :session
  belongs_to :user
end

# == Schema Information
#
# Table name: submissions
#
#  id         :uuid             not null, primary key
#  book_id    :uuid             not null
#  session_id :uuid             not null
#  user_id    :uuid             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_submissions_on_book_id     (book_id)
#  index_submissions_on_session_id  (session_id)
#  index_submissions_on_user_id     (user_id)
#
