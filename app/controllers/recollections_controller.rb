class RecollectionsController < ApplicationController
  before_action :set_book
  before_action :set_recollection, only: [:show, :edit, :update, :destroy]

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

  def edit
  end

  def update
    if @recollection.update(recollection_params)
      redirect_to book_recollection_path(@book, @recollection)
    else
      render 'edit'
    end
  end

  def destroy
    @recollection.destroy
    redirect_to book_path(@recollection.book)
  end


  def show
    @recollections = Recollection.where(book_id: @book.id).order("created_at")
  end

  private

  def recollection_params
    params.require(:recollection).permit(
                                        :read_term,
                                        :readed_day,
                                        :point,
                                        :phrase,
                                        :note
                                ).merge(book_id: params[:book_id])
  end

  def set_book
    @book = Book.find(params[:book_id])
  end

  def set_recollection
    @recollection = Recollection.find(params[:id])
  end

end
