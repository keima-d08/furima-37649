require 'rails_helper'

RSpec.describe BuyerDestination, type: :model do
  before do
    @buyer_destination = FactoryBot.build(:buyer_destination)
  end

  describe '商品購入' do
    context '商品購入出来る時'
    it '決済に必要な情報が全て存在すれば登録できる' do
      expect(@buyer_destination).to be_valid
    end

    it '建物名は空でもその他の情報が揃っていれば購入できる' do
      @buyer_destination.building_name = ''
      expect(@buyer_destination).to be_valid
    end

    context '商品購入出来ない時'
    it 'ユーザーIDがないと購入できない' do
      @buyer_destination.user_id = nil
      @buyer_destination.valid?
      expect(@buyer_destination.errors.full_messages).to include("User can't be blank")
    end

    it 'クレジットカード情報が全て揃っていないと購入できない' do
      @buyer_destination.token = ''
      @buyer_destination.valid?
      expect(@buyer_destination.errors.full_messages).to include("Token can't be blank")
    end

    it '郵便番号が空では購入できない' do
      @buyer_destination.postcode = ''
      @buyer_destination.valid?
      expect(@buyer_destination.errors.full_messages).to include("Postcode can't be blank")
    end

    it '都道府県が--では購入できない' do
      @buyer_destination.prefecture_id = '1'
      @buyer_destination.valid?
      expect(@buyer_destination.errors.full_messages).to include('Prefecture must be other than 1')
    end

    it '市区町村が空では購入できない' do
      @buyer_destination.municipalities = ''
      @buyer_destination.valid?
      expect(@buyer_destination.errors.full_messages).to include("Municipalities can't be blank")
    end

    it '番地が空では購入できない' do
      @buyer_destination.address = ''
      @buyer_destination.valid?
      expect(@buyer_destination.errors.full_messages).to include("Address can't be blank")
    end

    it '電話番号が空では購入できない' do
      @buyer_destination.phone_number = ''
      @buyer_destination.valid?
      expect(@buyer_destination.errors.full_messages).to include("Phone number can't be blank")
    end

    it '郵便番号が-を含む8桁の数字以外だと購入できない' do
      @buyer_destination.postcode = '1111111'
      @buyer_destination.valid?
      expect(@buyer_destination.errors.full_messages).to include('Postcode is the wrong length (should be 8 characters)')
    end

    it '郵便番号が全角だと購入できない' do
      @buyer_destination.postcode = '１１１-１１１１'
      @buyer_destination.valid?
      expect(@buyer_destination.errors.full_messages).to include('Postcode is invalid')
    end

    it '郵便番号に半角文字以外を入力すると購入できない' do
      @buyer_destination.postcode = '111ー1111'
      @buyer_destination.valid?
      expect(@buyer_destination.errors.full_messages).to include('Postcode is invalid')
    end

    it '電話番号は-を含まない10桁以上11桁以内の数字でないと登録できない' do
      @buyer_destination.phone_number = '111111111'
      @buyer_destination.valid?
      expect(@buyer_destination.errors.full_messages).to include('Phone number is too short (minimum is 10 characters)')
    end

    it '電話番号が全角数字だと購入できない' do
      @buyer_destination.phone_number = '１１１１１１１１１１'
      @buyer_destination.valid?
      expect(@buyer_destination.errors.full_messages).to include('Phone number is invalid')
    end

    it '電話番号に半角数字以外を入力すると購入できない' do
      @buyer_destination.phone_number = 'テスト'
      @buyer_destination.valid?
      expect(@buyer_destination.errors.full_messages).to include('Phone number is invalid')
    end
  end
end
