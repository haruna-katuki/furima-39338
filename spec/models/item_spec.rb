require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
    context '新規登録できるとき' do
      it 'image、item_name、captionが存在しており、category_id、state_id、postage_id、prefecture_id、shipping_day_idが1以外を選択している、かつpriceが300~9999999の間の値だと登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'imageが存在していないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'item_nameが存在していないと登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'item_nameが41文字以上だと登録できない' do
        @item.item_name = Faker::Lorem.characters(number: 41)
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name is too long (maximum is 40 characters)")
      end

      it 'captionが存在していないと登録できない' do
        @item.caption = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Caption can't be blank")
      end

      it 'captionが1001文字以上だと登録できない' do
        @item.caption = Faker::Lorem.characters(number: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include("Caption is too long (maximum is 1000 characters)")
      end

      it 'category_idが1だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'state_idが1だと登録できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end

      it 'postage_idが1だと登録できない' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end

      it 'prefecture_idが1だと登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
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
