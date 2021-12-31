# frozen_string_literal: true

module ReadSessionsHelper
  def next_session_name(club)
    number = club.read_sessions.count + 1
    t('.next_session_name', number: number)
  end

  def book_submitters(book, read_session)
    User
      .where_assoc_exists(:submissions, book: book, read_session: read_session)
      .pluck(:username)
      .join(', ')
  end

  def prefixed_time(time)
    prefix = if time.past?
               t('time.prefixes.past')
             else
               t('time.prefixes.future')
             end

    "#{prefix} #{time_ago_in_words(time)}"
  end
end
