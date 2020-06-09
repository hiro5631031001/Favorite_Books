class BooksController < ApplicationController
  def index
    # @book = Book.find(1)
  end

  def search
    if params[:keyword]
      @books = RakutenWebService::Books::Book.search(title: params[:keyword])
    end
  end

end
