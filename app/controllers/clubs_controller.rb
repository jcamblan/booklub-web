# frozen_string_literal: true

class ClubsController < ApplicationController
  before_action :set_club, only: %i[show edit update destroy]

  # GET /clubs
  def index
    @clubs = Club.all
  end

  # GET /clubs/1
  def show; end

  # GET /clubs/new
  def new
    @club = Club.new
  end

  # GET /clubs/1/edit
  def edit; end

  # POST /clubs
  def create
    @club = Club.new(club_params.merge(owner: current_user))

    if @club.save
      redirect_to @club, notice: 'Club was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clubs/1
  def update
    if @club.update(club_params)
      redirect_to @club, notice: 'Club was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /clubs/1
  def destroy
    @club.destroy
    redirect_to clubs_url, notice: 'Club was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_club
    @club = Club.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def club_params
    params.require(:club).permit(:invitation_code, :name, :owner_id)
  end
end
