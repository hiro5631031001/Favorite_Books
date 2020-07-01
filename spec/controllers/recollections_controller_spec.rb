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

  





end