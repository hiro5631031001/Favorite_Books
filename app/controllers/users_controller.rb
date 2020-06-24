class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  
  
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

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :birth_day, :image)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
