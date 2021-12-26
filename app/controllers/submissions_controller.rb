# frozen_string_literal: true

class SubmissionsController < ApplicationController
  before_action :set_read_session, only: %i[create new]

  # GET /read_sessions/:read_session_id/join
  def new
    @submission = Submission.new
  end

  # POST /read_sessions/:read_session_id/submissions
  def create
    book = Book.find_or_initialize_by(google_book_id: book_attributes[:google_book_id])
    book.assign_attributes(
      title: book_attributes[:title],
      authors: [book_attributes[:authors]].flatten.map do |name|
        Author.find_or_initialize_by(name: name)
      end
    )

    @submission = @read_session.submissions.new(user: current_user, book: book)

    if @submission.save
      redirect_to @read_session, notice: 'Submission was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_read_session
    @read_session = ReadSession.find(params[:read_session_id])
  end

  def book_attributes
    submission_params[:book_attributes]
  end

  def submission_params
    params.require(:submission)
          .permit(book_attributes: %i[google_book_id title authors])
  end
end
