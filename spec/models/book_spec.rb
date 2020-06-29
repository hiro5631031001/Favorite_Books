require 'rails_helper'

RSpec.describe Book, type: :model  do
  describe "#create" do

    context "bookを投稿できる時" do
      it "全てのカラムが存在する場合、投稿できること" do
        user = create(:user)
        book = FactoryBot.build(:book)
        expect(book).to be_valid
      end
    end

    context "bookを投稿できない時" do
      it "imageがない場合、投稿できないこと" do
        book = FactoryBot.build(:book, image: nil)
        book.valid?
        expect(book.errors[:image]).to include("を入力してください")
      end
  
      it "titleがない場合、投稿できないこと" do
        book = FactoryBot.build(:book, title: nil)
        book.valid?
        expect(book.errors[:title]).to include("を入力してください")
      end
  
      it "authorがない場合、投稿できないこと" do
        book = FactoryBot.build(:book, author: nil)
        book.valid?
        expect(book.errors[:author]).to include("を入力してください")
      end
  
      it "publisherがない場合、投稿できないこと" do
        book = FactoryBot.build(:book, publisher: nil)
        book.valid?
        expect(book.errors[:publisher]).to include("を入力してください")
      end
  
      it "categoryがない場合、投稿できないこと" do
        book = FactoryBot.build(:book, category: nil)
        book.valid?
        expect(book.errors[:category]).to include("を選択してください")
      end
  
      it "statusがない場合、投稿できないこと" do
        book = FactoryBot.build(:book, status: nil)
        book.valid?
        expect(book.errors[:status]).to include("を入力してください")
      end
  
      it "kindleがない場合、投稿できないこと" do
        book = FactoryBot.build(:book, kindle: nil)
        book.valid?
        expect(book.errors[:kindle]).to include("を選択してください")
      end
  
      it "buy_dateがない場合、投稿できないこと" do
        book = FactoryBot.build(:book, buy_date: nil)
        book.valid?
        expect(book.errors[:buy_date]).to include("を入力してください")
      end
  
      it "buy_dateの年が未入力の場合、投稿できないこと" do
        book = FactoryBot.build(:book, buy_date: "   -10-01")
        book.valid?
        expect(book.errors[:buy_date]).to include("を入力してください")
      end
  
      it "buy_dateの月が未入力の場合、投稿できないこと" do
        book = FactoryBot.build(:book, buy_date: "2020-  -01")
        book.valid?
        expect(book.errors[:buy_date]).to include("を入力してください")
      end
  
      it "buy_dateの日が未入力の場合、投稿できないこと" do
        book = FactoryBot.build(:book, buy_date: "2020-01-  ")
        book.valid?
        expect(book.errors[:buy_date]).to include("を入力してください")
      end
    end

  end
end