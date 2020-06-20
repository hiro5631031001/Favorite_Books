class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    # params[:book][:buy_date] = @buy_date.to_s
    @book = Book.new(book_params)
    @book.save!(book_params)
    redirect_to root_path
 end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id]) 
    @book.update(book_params)
    redirect_to root_path
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to root_path
  end

  # def search
  #   if params[:keyword]
  #     @books = RakutenWebService::Books::Book.search(title: params[:keyword])
  #   end
  # end

  private
  def book_params
    params.require(:book).permit(:title,
                                  :author,
                                  :publisher,
                                  :category,
                                  :buy_date,
                                  :image
                                ).merge(user_id: current_user.id)
  end

  # def read(result)
  #   title = result['title']
  #   author = result['author']
  #   url = result['itemUrl']
  #   isbn = result['isbn']
  #   publisher_name = result['publisherName']
  #   image_url = result['mediumImageUrl'].gsub('?_ex=120x120', '')

  #   {
  #     title: title,
  #     author: author,
  #     url: url,
  #     isbn: isbn,
  #     publisher_name: publisher_name,
  #     image_url: image_url
  #   }

  # end

end
