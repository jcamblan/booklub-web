# frozen_string_literal: true

class UsersController < Clearance::UsersController
  def update
    current_user.update(user_params.select { |_k, v| v.present? })

    redirect_to root_path, notice: 'Submission was successfully created.'
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
