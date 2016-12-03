require 'rails_helper'

RSpec.describe Category, type: :model do
  it "is invalid without a name" do
    ctg = Category.new()
    expect(ctg.valid?).to eq(false)
  end
end
