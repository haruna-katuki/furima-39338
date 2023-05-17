require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
    context '新規登録できるとき' do
      it 'image、item_name、captionが存在しており、category_id、state_id、postage_id、prefecture_id、shipping_day_idが1以外を選択している、かつpriceが300~9999999の間の値だと登録できる' do
      end
    end

    context '新規登録できないとき' do
      it 'imageが存在していないと登録できない' do
      end

      it 'item_nameが存在していないと登録できない' do
      end

      it 'item_nameが41文字以上だと登録できない' do
      end

      it 'captionが存在していないと登録できない' do
      end

      it 'captionが1001文字以上だと登録できない' do
      end

      it 'category_idが1だと登録できない' do
      end

      it 'state_idが1だと登録できない' do
      end

      it 'postage_idが1だと登録できない' do
      end

      it 'prefecture_idが1だと登録できない' do
      end

      it 'shipping_day_idが1だと登録できない' do
      end

      it 'priceが存在しないと登録できない' do
      end

      it 'priceが299以下だと登録できない' do
      end

      it 'priceが10000000以上だと登録できない' do
      end

      it 'priceが全角だと登録できない' do
      end

      it 'userに紐づいていないと登録できない' do
      end
    end
  end
end
