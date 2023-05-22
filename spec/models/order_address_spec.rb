require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入機能' do
    context '商品の購入ができる場合' do
      it 'postal_code、prefecture_id、city、house_number、building、telephone_number、tokenが存在すれば購入できる' do
      end

      it 'buildingが存在しなくても購入できる' do
      end
    end

    context '商品の購入ができない場合' do
      it 'postal_codeが存在しないと購入できない' do
      end

      it 'postal_codeの形式が正しくないと購入できない' do
      end

      it 'prefecture_idが1だと購入できない' do
      end

      it 'cityが存在しないと購入できない' do
      end

      it 'house_numberが存在しないと購入できない' do
      end

      it 'telephone_numberが存在しないと購入できない' do
      end

      it 'telephone_numberが半角数字11桁でないと購入できない' do
      end

      it 'tokenが存在しないと購入できない' do
      end

      it 'userと紐づいていないと購入できない' do
      end

      it 'itemと紐づいていないと購入できない' do
      end
    end
  end
end
