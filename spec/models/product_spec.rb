require 'rails_helper'
RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品', type: :model do
    context '正常系　商品出品できる' do
      it 'ログイン状態のユーザーは商品出品できる' do
        expect(@product).to be_valid
      end
    end

    context '異常系　商品情報が不完全だと出品できない' do
      it 'ログアウト状態のユーザーは、商品出品ページへ遷移しようとすると、ログインページへ遷移する' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('User must exist')
      end

      it '商品画像が添付されてないと出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が入力されてないと出品できない' do
        @product.product_name = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Product name can't be blank")
      end

      it '商品の説明が入力されてないと出品できない' do
        @product.feature = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Feature can't be blank")
      end

      it 'カテゴリーの情報が選択されてないと出品できない' do
        @product.category_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態が選択されてないと出品できない' do
        @product.condition_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition can't be blank")
      end

      it '配送料の負担が選択されてないと出品できない' do
        @product.send_charge_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Send charge can't be blank")
      end

      it '発送元の地域が選択されてないと出品できない' do
        @product.prefecture_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送までの日数が選択されてないと出品できない' do
        @product.send_span_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Send span can't be blank")
      end

      it 'カテゴリーの情報が未選択だと出品できない' do
        @product.category_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態が未選択だと出品できない' do
        @product.condition_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition can't be blank")
      end

      it '配送料の負担が未選択だと出品できない' do
        @product.send_charge_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Send charge can't be blank")
      end

      it '発送元の地域が未選択だと出品できない' do
        @product.prefecture_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送までの日数が未選択だと出品できない' do
        @product.send_span_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Send span can't be blank")
      end

      it '価格が入力されてないと出品できない' do
        @product.price = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end

      it '価格の範囲が、¥300以下だと出品できない' do
        @product.price = 250
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is out of setting range')
      end

      it '価格の範囲が、¥9,999,999以上だと出品できない' do
        @product.price = 99_999_999
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is out of setting range')
      end

      it '販売価格は全角数字だと出品できない' do
        @product.price = '５００'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is out of setting range')
      end

      it '販売価格は半角英字だと出品できない' do
        @product.price = 'monza'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is out of setting range')
      end

      it '販売価格は半角英数字混合だと出品できない' do
        @product.price = 'mnz1653'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is out of setting range')
      end

      it '販売価格は全角数字だと出品できない' do
        @product.price = '５００'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is out of setting range')
      end
    end
  end
end
