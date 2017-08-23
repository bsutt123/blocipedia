class RolesController < ApplicationController
  def update
    current_user.update(role: params[:role])
    if current_user.role =  params[:role]
      flash[:notice] = "You successfully changed your account to a "+params[:role]
    else
      flash[:alert] =  "There was a problem changing your account type"
    end
    redirect_to root_path
  end
end
