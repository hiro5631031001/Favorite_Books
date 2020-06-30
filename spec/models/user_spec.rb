require 'rails_helper'

RSpec.describe User, type: :model  do
  describe "#create" do

    context "user登録できる時" do

      it "全ての必要項目を入力している" do
        user = FactoryBot.build(:user)
        expect(user).to be_valid
      end

      it "全ての項目を入力し、nicknameが20文字以下の場合、保存できる" do
        user = FactoryBot.build(:user, nickname: "aabbaabbaabbaabbaabb")
        expect(user).to be_valid
      end

      it 'passwordが６文字以上であれば、保存できること' do
        user = FactoryBot.build(:user, password:"123456", password_confirmation: "123456")
        expect(user).to be_valid
      end

    end

    context "user登録できない時" do

      it "nicknameが入力されていない時、保存できない" do
        user = FactoryBot.build(:user, nickname: nil)
        user.valid?
        expect(user.errors[:nickname]).to include("を入力してください")
      end

      it "nicknameが21文字以上の場合、保存できない" do
        user = FactoryBot.build(:user, nickname: "aabbaabbaabbaabbaabbe")
        user.valid?
        expect(user.errors[:nickname]).to include("は20文字以下で入力してください")
      end

      it "emailが入力されていない時、保存できない" do
        user = FactoryBot.build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("を入力してください")
      end

      it '重複したemailがある場合、登録できないこと' do
        user = create(:user, email:"aaabbb@gmail.com")
        another_user = build(:user, email:"aaabbb@gmail.com")
        another_user.valid?
        expect(another_user.errors[:email]).to include("はすでに存在します")
      end

      it "imageが入力されていない時、保存できない" do
        user = FactoryBot.build(:user, image: nil)
        user.valid?
        expect(user.errors[:image]).to include("を入力してください")
      end

      it "birth_dayが全て入力されていない時、保存できない" do
        user = FactoryBot.build(:user, birth_day: nil)
        user.valid?
        expect(user.errors[:birth_day]).to include("を入力してください")
      end

      it "birth_dayの年が入力されていない時、保存できない" do
        user = FactoryBot.build(:user, birth_day: "    -10-01")
        user.valid?
        expect(user.errors[:birth_day]).to include("を入力してください")
      end

      it "birth_dayの月が入力されていない時、保存できない" do
        user = FactoryBot.build(:user, birth_day: "1986-  -01")
        user.valid?
        expect(user.errors[:birth_day]).to include("を入力してください")
      end

      it "birth_dayの日が入力されていない時、保存できない" do
        user = FactoryBot.build(:user, birth_day: "1986-10-  ")
        user.valid?
        expect(user.errors[:birth_day]).to include("を入力してください")
      end

      it "passwordが入力されていない時、保存できない" do
        user = FactoryBot.build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("を入力してください")
      end

      it 'passwordが存在してもpassword_confirmationが存在しなければ保存できない' do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
      end

      it 'passwordが５文字以下の場合、保存できないこと' do
        user = build(:user, password:"12345", password_confirmation: "12345")
        user.valid?
        expect(user.errors[:password]).to include("は6文字以上で入力してください")
      end
    end

  end
end