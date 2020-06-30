require 'rails_helper'

describe BooksController do
  let(:user) { create(:user)}
  let(:book) { create(:book)}

  before do
    login user
  end

  describe 'GET #new' do
    it "new.html.hamlへ遷移すること" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "@bookに正しい情報が入っていること" do
      get :edit, params: { id: book }
      expect(assigns(:book)).to eq book
    end

    it "edit.html.hamlへ遷移すること" do
      get :edit, params: { id: book }
      expect(response).to render_template :edit
    end
  end

  describe 'GET #show' do
    it "@bookに正しい情報が入っていること" do
      get :show, params: { id: book }
      expect(assigns(:book)).to eq book
    end

    it "show.html.hamlへ遷移すること" do
      get :show, params: { id: book }
      expect(response).to render_template :show
    end
  end

  describe 'GET #index' do
    it "@booksに正しい値が入っていること" do
      books = create_list(:book,3)
      get :index
      expect(assigns(:books)).to match(books.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it 'index.html.hamlに遷移すること' do
      get :index
      expect(response).to render_template :index
    end
  end


end