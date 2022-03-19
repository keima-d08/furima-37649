require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品出来る時'
    it '必要な商品情報が全て存在すれば登録できる' do
      expect(@item).to be_valid
    end

    context '商品出品出来ない時'
    it 'ユーザー情報無しでは出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end

    it '商品画像無しでは出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が空では出品できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明が空では出品できない' do
      @item.content = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Content can't be blank")
    end

    it 'カテゴリーが--では出品できない' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it '商品の状態が--では出品できない' do
      @item.status_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end

    it '配送料の負担が--では出品できない' do
      @item.postage_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage must be other than 1")
    end

    it '発送元の地域が--では出品できない' do
      @item.prefecture_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it '発送までの日数が--では出品できない' do
      @item.days_to_ship_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to ship must be other than 1")
    end

    it '販売価格が空では出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '商品名が40文字以上では出品できない' do
      @item.name = 'a' * 41
      @item.valid?
      expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
    end

    it '商品説明が1000文字以上では出品できない' do
      @item.content ='a'*1001
      @item.valid?
      expect(@item.errors.full_messages).to include("Content is too long (maximum is 1000 characters)")
    end


    it '販売価格が¥300以下では出品できない' do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it '販売価格が¥9999999以上では出品できない' do
      @item.price = 1000000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

  end
end

