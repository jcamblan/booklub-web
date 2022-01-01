# frozen_string_literal: true

class ReadSessionsController < ApplicationController
  before_action :set_club, only: %i[create new]

  # GET /clubs/:club_id/sessions/new
  def show
    @read_session = ReadSession.find(params[:id])
  end

  # GET /clubs/:club_id/sessions/new
  def new
    @read_session = @club.read_sessions.new
  end

  # POST /clubs/:club_id/sessions
  def create
    @read_session = ReadSession.new(read_session_params.merge(club: @club))

    if @read_session.save
      redirect_to @read_session, notice: 'Session was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_club
    @club = Club.find(params[:club_id])
  end

  def read_session_params
    params.require(:read_session)
          .permit(:name, :read_due_date, :submission_due_date)
  end
end
