class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create]
  before_action :set_bookmark, only: :destroy
def index
  @bookmark = Bookmark.all
end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @bookmark.save
    redirect_to lists_path
  end

  def show
    @bookmark = Movie.find(params[:id])
  end

  def destroy
    @bookmark.destroy
    @list = List.find(params[:list_id])
    redirect_to list_path(@list)
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
