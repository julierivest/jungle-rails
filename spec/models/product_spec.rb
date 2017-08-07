require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.new(name: 'furniture')

    end

    # validation tests/examples here
    it "is valid if has all attributes" do
      @product = Product.new(name: 'chair', price: 50, quantity: 2, category: @category)
      expect(@product.valid?).to be true
    end

    it "is not valid if name not present" do
      @product = Product.new(price: 30, quantity: 1, category: @category)
      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "is not valid if price not present" do
      @product = Product.new(name: 'chair', quantity: 1, category: @category)
      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it "is not valid if quantity not present" do
      @product = Product.new(name: 'chair', price: 30, category: @category)
      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "is not valid if category not present" do
      @product = Product.new(name: 'chair', price: 30, quantity: 1)
      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end

