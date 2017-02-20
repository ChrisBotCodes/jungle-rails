require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'is valid and successfully saves with valid attributes' do
      @category = Category.new(name: 'Furniture')
      @product = Product.new(name: 'Comfy Chair', price: 50, quantity: 10, category: @category)
      expect(@product.save).to be true
    end

    it 'is invalid without a name' do
      @category = Category.new(name: 'Furniture')
      @product = Product.new(name: nil, price: 50, quantity: 10, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'is invalid without a price' do
      @category = Category.new(name: 'Furniture')
      @product = Product.new(name: 'Comfy Chair', price: nil, quantity: 10, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'is invalid without a quantity' do
      @category = Category.new(name: 'Furniture')
      @product = Product.new(name: 'Comfy Chair', price: 50, quantity: nil, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'is invalid without a category' do
      @product = Product.new(name: 'Comfy Chair', price: 50, quantity: 10, category: nil)
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end