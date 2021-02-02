require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    before do
      @user = FactoryBot.build(:user)
    end
    describe '新規登録' do
      context '新規登録成功' do
        it '全ての項目が正常に入力されていれば登録できる' do
          expect(@user).to be_valid
        end
      end
      context '新規登録失敗' do
        it 'nicknameが空白だと登録できない' do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include('ニックネームを入力してください')
        end
        it 'nicknameが3文字以下だと登録できない' do
          @user.nickname = "abc"
          @user.valid?
          expect(@user.errors.full_messages).to include('ニックネームは4文字以上で入力してください')
        end
        it 'nicknameが21文字以上だと登録できない' do
          @user.nickname = "123456789a123456789b1"
          @user.valid?
          expect(@user.errors.full_messages).to include('ニックネームは20文字以内で入力してください')
        end
        it "既に使用されているnicknameだと登録できない" do
          @user.save
          another_user = FactoryBot.build(:user, nickname: @user.nickname)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('ニックネームはすでに存在します')
        end
        it 'passwordが空白だと登録できない' do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードが入力されていません。')
        end
        it 'passwordが5文字以下だと登録できない' do
          @user.password = "1234a"
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードは6文字以上に設定して下さい。')
        end
        it 'passwordが英字だけだと登録できない' do
          @user.password = "abcdef"
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードは有効でありません。')
        end
        it 'passwordが数字だけだと登録できない' do
          @user.password = "123456"
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードは有効でありません。')
        end
        it 'passwordに英数字以外の文字が含まれると登録できない' do
          @user.password = "あいうえお123abc"
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードは有効でありません。')
        end
        it 'password_confirmationが空白だと登録できない' do
          @user.password_confirmation = nil
          @user.valid?
          expect(@user.errors.full_messages).to include('確認用パスワードを入力してください')
        end
        it 'password_confirmationがpasswordと一致していないと登録できない' do
          @user.password_confirmation = "#{@user.password}abc"
          @user.valid?
          expect(@user.errors.full_messages).to include('確認用パスワードとパスワードの入力が一致しません')
        end
      end
    end
  end
end