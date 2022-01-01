# frozen_string_literal: true

class NotesController < ApplicationController
  before_action :set_read_session, only: %i[create new]

  # GET /read_sessions/:read_session_id/notes/new
  def new
    @note = @read_session.notes.find_or_initialize_by(book: @read_session.selected_book, user: current_user)
  end

  # POST /read_sessions/:read_session_id/submissions
  def create
    @note = @read_session.notes.new(book: @read_session.selected_book, user: current_user)
    @note.assign_attributes(note_params)

    if @note.save
      redirect_to @read_session, notice: 'note was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /notes/:id/edit
  def edit
    @note = Note.find(params[:id])
  end

  # POST /notes/:id
  def update
    @note = Note.find(params[:id])
    @note.assign_attributes(note_params)

    if @note.save
      redirect_to @note.read_session, notice: 'note was successfully updated.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_read_session
    @read_session = ReadSession.find(params[:read_session_id])
  end

  def note_params
    params.require(:note).permit(:value)
  end
end
