require 'rails_helper'

RSpec.describe Seller, type: :model do
  it "is valid with name, phone number and email" do
    seller = Seller.new(name: "John Doe", phone_number: "025-500500", email: "johndoe@beljom.sl", password: "foobar", password_confirmation: "foobar")
    expect(seller.valid?).to eq(true)
  end
  it "is invalid without name" do
    seller = Seller.new(phone_number: "025-500500", email: "johndoe@beljom.sl")
    expect(seller.valid?).to eq(false)
  end
  it "is invalid without phone_number" do
    seller = Seller.new(name: "John Doe", email: "johndoe@beljom.sl")
    expect(seller.valid?).to eq(false)
  end
  it "is invalid without email" do
    seller = Seller.new(name: "John Doe", phone_number: "025-500500")
    expect(seller.valid?).to eq(false)
  end
  it "is invalid with duplicate email" do
    Seller.create(name: "John Doe", phone_number: "025-500500", email: "jdoe@beljom.sl")
    seller = Seller.new(name: "Jane Doe", phone_number: "025-500501", email: "jdoe@beljom.sl")
    expect(seller.valid?).to eq(false)
  end
  it "is invalid with wrong format address" do
    seller = Seller.new(name: "John Doe", phone_number: "025-500500", email: "johndoebeljom.sl")
    expect(seller.valid?).to eq(false)
  end
end
