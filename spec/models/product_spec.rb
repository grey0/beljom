require 'rails_helper'

RSpec.describe Product, type: :model do
  it "is valid with a name and description" do
    prod = Product.new(name: "06 Range Rover", description: "super charged")
    expect(prod.valid?).to eq(true)
  end

  it "is invalid without a name" do
    prod = Product.new(description: "super charged")
    expect(prod.valid?).to eq(false)
  end

  it "is invalid without a description" do
    prod = Product.new(name: "06 Range Rover")
    expect(prod.valid?).to eq(false)
  end
end
