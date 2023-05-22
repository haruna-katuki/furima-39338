require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入機能' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
    end
  
    context '商品の購入ができる場合' do
      it 'postal_code、prefecture_id、city、house_number、building、telephone_number、tokenが存在すれば購入できる' do
        expect(@order_address).to be_valid
      end

      it 'buildingが存在しなくても購入できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '商品の購入ができない場合' do
      it 'postal_codeが存在しないと購入できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeの形式が正しくないと購入できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'prefecture_idが1だと購入できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが存在しないと購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが存在しないと購入できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'telephone_numberが存在しないと購入できない' do
        @order_address.telephone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number can't be blank")
      end

      it 'telephone_numberが半角数字11桁でないと購入できない' do
        @order_address.telephone_number = 1234567890
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number is invalid")
      end

      it 'tokenが存在しないと購入できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'userと紐づいていないと購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemと紐づいていないと購入できない' do
      end
    end
  end
end
