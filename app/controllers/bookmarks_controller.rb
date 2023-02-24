class BookmarksController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save!
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
