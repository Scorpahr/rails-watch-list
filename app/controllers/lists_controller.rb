class ListsController < ApplicationController

  def index
    @lists = List.all
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.new(lists_params)
    if @list.save
      redirect_to lists_path(@list)
    else
      @lists = List.all
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path, status: :see_other
  end

  private

  def lists_params
    params.require(:list).permit(:name)
  end
end
