require 'rails_helper'

describe RecollectionsController do
  let(:user) { create(:user)}
  let(:book) { create(:book)}
  let(:recollection){create(:recollection)}

  before do
    login user
  end

  describe 'GET #new' do
    it "new.html.hamlへ遷移すること" do
      get :new ,params: {book_id: book}
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "@recollectionに正しい値が入っていること" do
      get :edit, params: { id: recollection, book_id: recollection.book_id}
      expect(assigns(:recollection)).to eq recollection
    end

    it "edit.html.hamlへ遷移するこt" do
      get :edit, params: { id: recollection, book_id: recollection.book_id}
      expect(response).to render_template :edit
    end
  end







end