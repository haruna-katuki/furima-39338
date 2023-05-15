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
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@が含まれていないと登録できない' do
        @user.email = 'testgmail'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'emailが他のユーザーと重複していると登録できない' do
      end
      it 'passwordが空だと登録できない' do
      end
      it 'passwordとpassword_confirmationが不一致だと登録できない' do
      end
      it 'passwordが5文字以下だと登録できない' do
      end
      it 'passwordが129文字以上だと登録できない' do
      end
      it 'family_nameが空だと登録できない' do
      end
      it 'family_nameが全角でないと登録できない' do
      end
      it 'first_nameが空だと登録できない' do
      end
      it 'first_nameが全角でないと登録できない' do
      end
      it 'family_name_kanaが空だと登録できない' do
      end
      it 'family_name_kanaが全角カタカナでないと登録できない' do
      end
      it 'first_name_kanaが空だと登録できない' do
      end
      it 'first_name_kanaが全角カタカナでないと登録できない' do
      end
      it 'birth_dateが空だと登録できない' do
      end
    end
  end
end
