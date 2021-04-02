require 'rails_helper'
RSpec.describe PurchaseForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.create(:product)
    @purchase_form = FactoryBot.build(:purchase_form)
    @purchase_form.user_id = @user.id
    @purchase_form.product_id = @product.id
    sleep(1)
  end

  describe '商品購入', type: :model do
    context '正常系 商品購入できる' do
      it '必要な情報を適切に入力すると、商品の購入ができる' do
        expect(@purchase_form).to be_valid
      end
    end

    context '異常系 クレジット関連', type: :model do
      it 'トークンが空白だと決済できないこと' do
        @purchase_form.token = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Token can't be blank")
      end

      it '配送先の情報として、郵便番号が必須であること' do
        @purchase_form.postal_code = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にはハイフンが必要であること' do
        @purchase_form.postal_code = '1234567'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Postal code is invalid')
      end
      it '郵便番号が７桁以下だとエラーが出ること' do
        @purchase_form.postal_code = '123456'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Postal code is invalid')
      end
      it '郵便番号が９桁以上だとエラーが出ること' do
        @purchase_form.postal_code = '123456789'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Postal code is invalid')
      end
      it '配送先の情報として、都道府県が選択されていないとエラーが出ること' do
        @purchase_form.prefecture_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '配送先の情報として、市区町村が必須であること' do
        @purchase_form.municipality = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Municipality can't be blank")
      end
      it '配送先の情報として、番地が必須であること' do
        @purchase_form.banch = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Banch can't be blank")
      end
      it '配送先の情報として、電話番号が必須であること' do
        @purchase_form.telephone = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Telephone can't be blank")
      end
      it '電話番号はハイフンは不要であること' do
        @purchase_form.telephone = '012-3456-7890'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Telephone is invalid')
      end
      it '電話番号は11桁以内であること' do
        @purchase_form.telephone = '012345678901'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Telephone is too long (maximum is 11 characters)')
      end
    end
  end
end
