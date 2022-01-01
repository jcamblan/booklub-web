# frozen_string_literal: true

class ClubUsersController < ApplicationController
  # GET /club_users/new
  def new
    @club_user = ClubUser.new
  end

  # POST /club_users
  def create
    club = Club.find_by(permitted_params)
    @club_user = ClubUser.new(club: club, user: current_user)

    if @club_user.save
      redirect_to club, notice: t('.welcome_message')
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def permitted_params
    params.permit(:invitation_code)
  end
end
