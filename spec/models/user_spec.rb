require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname、email、password、family_name、first_name、family_name_kana、first_name_kana、birth_dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'emailに@が含まれていないと登録できない' do
        @user.email = 'testgmail'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it 'emailが他のユーザーと重複していると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordとpassword_confirmationが不一致だと登録できない' do
        @user.password_confirmation = 'M89pb4Rgf'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordが英字のみだと登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'passwordが数字のみだと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'passwordが全角だと登録できない' do
        @user.password = 'ABCDEF'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'passwordが5文字以下だと登録できない' do
        @user.password = 'abcd5'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'family_nameが空だと登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(姓)を入力してください")
      end
      it 'family_nameが全角でないと登録できない' do
        @user.family_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(姓)は不正な値です")
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(名)を入力してください")
      end
      it 'first_nameが全角でないと登録できない' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(名)は不正な値です")
      end
      it 'family_name_kanaが空だと登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(姓)を入力してください")
      end
      it 'family_name_kanaが全角カタカナでないと登録できない' do
        @user.family_name_kana = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(姓)は不正な値です")
      end
      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(名)を入力してください")
      end
      it 'first_name_kanaが全角カタカナでないと登録できない' do
        @user.first_name_kana = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(名)は不正な値です")
      end
      it 'birth_dateが空だと登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
