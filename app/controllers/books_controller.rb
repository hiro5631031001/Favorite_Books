class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @books = []

    @title = params[:title]
    if @title.present?
      results = RakutenWebService::Books::Book.search({
        title: @title,
        hits: 20,
      })

      results.each do |result|
        book = Book.new(read(result))
        @books << book
      end
    end
  end

  def create
    @book = Book.find_or_initialize_by(isbn: params[:isbn])

    unless @book.persisted?
      results = RakutenWebService::Books::Book.search(isbn: @book.isbn)
      @book = Book.new(read(results.first))
      @book.save
      redirect_to root_path
    end
 end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
    if params[:keyword]
      @books = RakutenWebService::Books::Book.search(title: params[:keyword])
    end
  end

  private
  def books_params
    params.permit(:image_url, :title, :author, :publisher_name, :isbn,:url)
  end

  def read(result)
    title = result['title']
    author = result['author']
    url = result['itemUrl']
    isbn = result['isbn']
    publisher_name = result['publisherName']
    image_url = result['mediumImageUrl'].gsub('?_ex=120x120', '')

    {
      title: title,
      author: author,
      url: url,
      isbn: isbn,
      publisher_name: publisher_name,
      image_url: image_url
    }

  end

end
