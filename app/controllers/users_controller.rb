class UsersController < ApplicationController
  before_action :set_user, only: [:show, 
                                  :edit, 
                                  :update, 
                                  :bookcase, 
                                  :category]
  before_action :set_user_recollection, only: [:show]
  
  
  def show
    @buy_books = @user.books.where(status: "book_recollection_none").order("created_at DESC").limit(10)
    @readed_books = @user.books.where(status: "book_recollection_exist").order("created_at DESC").limit(10)
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
    @novels = @user.books.category_novel.all.order("created_at DESC").limit(8)
    @managements = @user.books.category_management.all.order("created_at DESC").limit(8)
    @economies = @user.books.category_economy.all.order("created_at DESC").limit(8)
    @philosophies = @user.books.category_philosophy.all.order("created_at DESC").limit(8)
    @psychology = @user.books.category_psychology.all.order("created_at DESC").limit(8)
    @motivations = @user.books.category_motivation.all.order("created_at DESC").limit(8)
    @comics = @user.books.category_comic.all.order("created_at DESC").limit(8)
    @etcs = @user.books.category_etc.all.order("created_at DESC").limit(8)
  end

  def bookcase
    @bookcase = @user.books.all.order("created_at DESC")
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
