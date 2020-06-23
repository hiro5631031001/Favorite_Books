class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @buy_books = @user.books.where(status: "book_recollection_none").order("created_at DESC").limit(10)
    @readed_books = @user.books.where(status: "book_recollection_exist").order("created_at DESC").limit(10)
  end
end
