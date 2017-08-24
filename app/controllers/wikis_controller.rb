class WikisController < ApplicationController
  def index
    @wikis = Wiki.all.where(private: false)
  end

  def new
    @wiki = Wiki.new
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def delete
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    if @wiki.destroy
      flash[:notice] = "You successfully deleted the Wiki."
      redirect_to wikis_path
    else
      flash[:alert] = "There was an error deleting your Wiki."
      redirect_to @wiki
    end
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.assign_attributes(wiki_params)

    authorize @wiki
    if @wiki.save
      flash[:notice] = "You Wiki was successully edited."
      redirect_to @wiki
    else
      flash[:alert] = "There was a problem saving your changes."
      render :edit
    end

  end

  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.user_ids = current_user.id
    @wiki.owner = current_user.name
    if current_user.wiki_ids == nil
      current_user.wiki_ids = @wiki.id
    else
      current_user.wiki_ids.push(@wiki.id)
    end

    if @wiki.save
      flash[:notice] = "You successfully saved the new Wiki!"
      redirect_to @wiki
    else
      flash[:alert] = "There was a problem saving your Wiki, please try again."
      redirect_to root_path
    end
  end

  def private
    @wikis = current_user.wikis
    authorize @wikis
  end


  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end
end
