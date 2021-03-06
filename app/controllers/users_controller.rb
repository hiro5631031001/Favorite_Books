class UsersController < ApplicationController
  before_action :set_user, only: [:show, 
                                  :edit, 
                                  :update, 
                                  :bookcase, 
                                  :category,
                                  :read_log]
  before_action :set_user_recollection, only: [:show,:read_log]
  
  
  def show
    @buy_books = @user.books.where(status: "book_recollection_none").order("created_at DESC").limit(10)
    @readed_books = @user.books.where(status: "book_recollection_exist").order("created_at DESC").limit(10)

    @novels = @user.books.category_novel.all.order("created_at DESC")
    @managements = @user.books.category_management.all.order("created_at DESC")
    @economies = @user.books.category_economy.all.order("created_at DESC")
    @philosophies = @user.books.category_philosophy.all.order("created_at DESC")
    @psychologies = @user.books.category_psychology.all.order("created_at DESC")
    @motivations = @user.books.category_motivation.all.order("created_at DESC")
    @comics = @user.books.category_comic.all.order("created_at DESC")
    @etcs = @user.books.category_etc.all.order("created_at DESC")
    
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def category
    @novels = @user.books.category_novel.all.order("created_at DESC")
    @managements = @user.books.category_management.all.order("created_at DESC")
    @economies = @user.books.category_economy.all.order("created_at DESC")
    @philosophies = @user.books.category_philosophy.all.order("created_at DESC")
    @psychologies = @user.books.category_psychology.all.order("created_at DESC")
    @motivations = @user.books.category_motivation.all.order("created_at DESC")
    @comics = @user.books.category_comic.all.order("created_at DESC")
    @etcs = @user.books.category_etc.all.order("created_at DESC")
  end

  def bookcase
    @bookcase = @user.books.all.order("created_at DESC")
  end

  def read_log
    @book_buy_logs = @user.books.all.order("buy_date ASC")
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :birth_day, :image)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_user_recollection
    @recollections = Recollection.where(book_id: @user.books.ids)
  end
end
