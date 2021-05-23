require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できる場合' do
      it '全ての値が正しければ登録できる' do
        expect(@user).to be_valid
      end
    end
    
    context '新規登録できない場合' do
      it '名前が空であれば登録できない' do
        @user.name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include ('名前を入力してください')
      end

      it '名前がひらがな、カタカナ、漢字以外であれば登録できない' do
        @user.name = "taro"
        @user.valid?
        expect(@user.errors.full_messages).to include ('名前は日本語のみを入力してください')
      end

      it 'メールアドレスが空であれば登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include ('Eメールを入力してください')
      end

      it '同じメールアドレスが存在すれば登録できない' do
        @user.save
        user2 = FactoryBot.build(:user, email: @user.email)
        user2.valid?
        expect(user2.errors.full_messages).to include ('Eメールはすでに存在します')
      end

      it 'パスワードが空であれば登録できない' do
        @user.password = nil
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors.full_messages).to include ('パスワードを入力してください')
      end

      
      it 'パスワードが数字のみであれば登録できない' do
        @user.password = 123456
        @user.password_confirmation = 123456
        @user.valid?
        expect(@user.errors.full_messages).to include ('パスワードは英語と数字の両方を含めてください')
      end

      it 'パスワードが英語のみであれば登録できない' do
        @user.password = "abcdef"
        @user.password_confirmation = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include ('パスワードは英語と数字の両方を含めてください')
      end
      
      it 'パスワードが５文字以下であれば登録できない' do
        @user.password = "ab123"
        @user.password_confirmation = "ab123"
        @user.valid?
        expect(@user.errors.full_messages).to include ('パスワードは6文字以上で入力してください')
      end

      it '年齢が空であれば登録できない' do
        @user.age = nil
        @user.valid?
        expect(@user.errors.full_messages).to include ('年齢を入力してください')
      end

      it '年齢が数字でなければ登録できない' do
        @user.age = "ab"
        @user.valid?
        expect(@user.errors.full_messages).to include ('年齢は半角数字のみを入力してください')
      end

      it '年齢が半角数字でなければ登録できない' do
        @user.age = '１２'
        @user.valid?
        expect(@user.errors.full_messages).to include ('年齢は半角数字のみを入力してください')
      end
    end
  end
end