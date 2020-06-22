class RecollectionsController < ApplicationController

  def new
    @book = Book.find(params[:book_id])
    @recollection = Recollection.new
  end

  def create
    @book = Book.find(params[:book_id])
    @recollection = Recollection.create(recollection_params)
    if @recollection.save
      @recollection.book.book_read
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def recollection_params
    params.require(:recollection).permit(
                                        :read_term,
                                        :readed_day,
                                        :point,
                                        :reread_timing,
                                        :phrase,
                                        :note
                                ).merge(book_id: params[:book_id])
  end


end
