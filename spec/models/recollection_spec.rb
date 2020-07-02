require 'rails_helper'

RSpec.describe Recollection, type: :model  do
  context 'recollectionを保存できる時' do
    it "全てのカラムが存在する場合、保存できること" do
      book = create(:book)
      recollection = FactoryBot.build(:recollection)
      expect(recollection).to be_valid
    end

    it "全てのカラムが存在する場合、かつ、noteが3000文字以下の場合、保存できること" do
      book = create(:book)
      recollection = FactoryBot.build(:recollection, note: "a" * 3000)
      expect(recollection).to be_valid
    end

    it "全てのカラムが存在する場合、かつ、phraseが1000文字以下の場合、保存できること" do
      book = create(:book)
      recollection = FactoryBot.build(:recollection, phrase: "a" * 1000)
      expect(recollection).to be_valid
    end

    it "phraseカラム以外の全てのカラムが存在している時、保存できること" do
      book = create(:book)
      recollection = FactoryBot.build(:recollection, phrase: nil)
      expect(recollection).to be_valid
    end

  end

  context 'recollectionを保存できない時' do
    it "read_termが未入力の場合、保存できない" do
      recollection = FactoryBot.build(:recollection, read_term: nil)
      recollection.valid?
      expect(recollection.errors[:read_term]).to include("を入力してください")
    end

    # it "read_termがの場合、保存できない" do
    #   recollection = FactoryBot.build(:recollection, read_term: 0)
    #   recollection.valid?
    #   expect(recollection.errors[:read_term]).to include("は1以上の値にしてください")
    # end

    it "readed_dayが未入力の場合、保存できない" do
      recollection = FactoryBot.build(:recollection, readed_day: nil)
      recollection.valid?
      expect(recollection.errors[:readed_day]).to include("を入力してください")
    end

    it "pointが未入力の場合、保存できない" do
      recollection = FactoryBot.build(:recollection, point: nil)
      recollection.valid?
      expect(recollection.errors[:point]).to include("を入力してください")
    end

    # it "pointが0の場合、保存できない" do
    #   recollection = FactoryBot.build(:recollection, point: 0)
    #   recollection.valid?
    #   expect(recollection.errors[:point]).to include("は1以上の値にしてください")
    # end

    it "noteが未入力の場合、保存できない" do
      recollection = FactoryBot.build(:recollection, note: nil)
      recollection.valid?
      expect(recollection.errors[:note]).to include("を入力してください")
    end

    it "noteが3000文字以上の場合、保存できない" do
      recollection = FactoryBot.build(:recollection, note: "a" * 3001)
      recollection.valid?
      expect(recollection.errors[:note]).to include("は3000文字以内で入力してください")
    end

    it "phraseが1000文字以上の場合、保存できない" do
      recollection = FactoryBot.build(:recollection, phrase: "a" * 1001)
      recollection.valid?
      expect(recollection.errors[:phrase]).to include("は1000文字以内で入力してください")
    end
  end
end