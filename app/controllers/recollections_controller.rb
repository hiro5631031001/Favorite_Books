class RecollectionsController < ApplicationController
  before_action :set_book

  def index
    @recollections = Recollection.where(book_id: @book.id).order("created_at")
  end


  def new
    @recollection = Recollection.new
  end

  def create
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

  def set_book
    @book = Book.find(params[:book_id])
  end


end
