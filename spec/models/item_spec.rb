require 'rails_helper'
describe Item, type: :model do
  describe '#create' do
    it "nameがない場合は登録できないこと" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "textがない場合は登録できないこと" do
      item = build(:item, text: "")
      item.valid?
      expect(item.errors[:text]).to include("を入力してください")
    end

    it "priceがない場合は登録できないこと" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    it "item_condtion_idがない場合は登録できないこと" do
      item = build(:item,condtion_id: "")
      item.valid?
      expect(item.errors[:condtion_id]).to include("を入力してください")
    end

    it "prefecture_idがない場合は登録できないこと" do
      item = build(:item, prefecture_id: "")
      item.valid?
      expect(item.errors[:prefecture_id]).to include("を入力してください")
    end

    it "postage_type_idがない場合は登録できないこと" do
      item = build(:item, postage_type_id: "")
      item.valid?
      expect(item.errors[:postage_type_id]).to include("を入力してください")
    end

    it "days_until_shipping_idがない場合は登録できないこと" do
      item = build(:item, days_until_shipping_id: "")
      item.valid?
      expect(item.errors[:days_until_shipping_id]).to include("を入力してください")
    end

    it "imageがない場合は登録できないこと" do
      item = build(:item, images: [])
      item.valid?
      expect(item.errors[:images]).to include("を入力してください")
    end

    it "category_idがない場合は登録できないこと" do
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end

  end
end
