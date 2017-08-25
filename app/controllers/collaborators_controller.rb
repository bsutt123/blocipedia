class CollaboratorsController < ApplicationController

  def edit
    @wiki_id = params[:wiki_id]
    @users = User.all.where(role: 1)
    @wiki = Wiki.find(@wiki_id)
    @collaborators = @wiki.users
  end

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.find(params[:user_id])
    Collaborator.create(user: @user, wiki: @wiki)
    flash[:notice] = "You successfully added a collaborator"
    redirect_to @wiki
  end

  def destroy

    @collaborator  = Collaborator.find_by_user_id(params[:user_id])
    if @collaborator.destroy
      flash[:notice] =  "You successfully removed a collaborator"
    else
      flash[:alert] =  "There was a problem removing the collaborator"

    end
    redirect_to @wiki
  end

end
