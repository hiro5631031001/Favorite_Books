class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.includes(:user).order("created_at DESC")
  end

  def show
    @recollections = @book.recollections.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    
    if @book.save(book_params)
      redirect_to root_path
    else
      render :new
    end
 end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
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
                                  :image,
                                  :kindle
                                ).merge(user_id: current_user.id)
  end

  def set_book
    @book = Book.find(params[:id])
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
