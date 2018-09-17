require 'rails_helper'

RSpec.describe Product, type: :model do


  describe 'Validations' do

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_presence_of(:category) }

  end

  before :each do
    @product = Product.new
    @category = Category.new

    @product.name = "Anything"
    @product.price = 23
    @product.quantity = 3
    @product.category = @category

  end

  it "is valid with valid attributes" do

    expect(@product).to be_valid
  end

  it "is invalid with empty name" do
    @product.name = ''
    expect(@product).to be_invalid
    expect(@product.errors.full_messages).to include("Name can't be blank")
  end


  it "is invalid with empty price" do
    @product.price_cents = nil
    expect(@product).to be_invalid
    expect(@product.errors.full_messages).to include("Price can't be blank")
  end

  it "is invalid with invalid category" do
    @product.category_id = 'dolphins'
    expect(@product).to be_invalid
    expect(@product.errors.full_messages).to include("Category can't be blank")
  end

  it "is invalid with invalid quantity" do
    @product.quantity = nil
    expect(@product).to be_invalid
    expect(@product.errors.full_messages).to include("Quantity can't be blank")
  end

end
