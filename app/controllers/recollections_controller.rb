class RecollectionsController < ApplicationController

  def new
    @recollection = Recollection.new
  end

  def create
    @recollection = Recollection.create(recollection_params)
    if @recollection.save
      @recollection.book.book_read
      redirect_to book_recollection_path(@book)
    else
      render 'new'
    end
  end

  private

  def recollection_params
    params.require(:impression).permit(:book_id,
                                        :read_term,
                                        :readed_day,
                                        :point,
                                        :reread_timing,
                                        :phrase,
                                        :note
                                ).merge(book_id: params[:book_id])
    end
    
  end


end
