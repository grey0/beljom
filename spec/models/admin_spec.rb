require 'rails_helper'

RSpec.describe Admin, type: :model do
  it "is valid with name, email, password and confirmed password" do
    admin = Admin.new(name: 'John Doe', email: 'jdoe@beljom.sl', password: '123456', password_confirmation: '123456')
    expect(admin.valid?).to eq(true)
  end

  it "is not valid if password length is less than 6" do
    admin = Admin.new(name: 'John Doe', email: 'jdoe@beljom.sl', password: '12345', password_confirmation: '12345')
    expect(admin.valid?).to eq(false)
  end

  it "is not valid with incorrect email format" do
    admin = Admin.new(name: 'John Doe', email: 'jdoebeljom.sl', password: '123456', password_confirmation: '123456')
    expect(admin.valid?).to eq(false)
  end
end
