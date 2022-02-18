class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    # raise
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      redirect_back fallback_location: root_path
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
