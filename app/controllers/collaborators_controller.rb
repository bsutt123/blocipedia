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
    @wiki.user_ids = @wiki.user_ids.push(@user.id)
    @user.wiki_ids = @user.wiki_ids.push(@wiki.id)
    if @wiki.user_ids.include? @user.id
      flash[:notice] = "You successfully added a collaborator"
    else
      flash[:alert] = "There was a problem adding your collaborator"
    end
    redirect_to @wiki
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.find(params[:user_id])
    if @wiki.owner && @wiki.owner == @user.name
      flash[:alert] =  "You can't delete the owner of the wiki!"
    else
      @wiki.user_ids = @wiki.user_ids.reject {|id| id ==  @user.id}
      @user.wiki_ids = @user.wiki_ids.reject {|id| id == @wiki.id}
      flash[:notice] = "You successfully removed #{@user.name} as a collaborator"
    end
    redirect_to @wiki
  end

end
