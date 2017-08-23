class RolesController < ApplicationController
  def update
    current_user.update_attributes(role: params[:desired_role])
    redirect_to root_path
  end

  def user_params
  end
end
