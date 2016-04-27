require 'rails_helper'

describe Store do
  it "has a valid factory" do
  	expect(FactoryGirl.create(:store)).to be_valid
  end
  it "is invalid without a name" do
  	expect(FactoryGirl.build(:store, name: nil)).not_to be_valid
  end
  it "is invalid without an address" do
  	expect(FactoryGirl.build(:store, address: nil)).not_to be_valid
  end
end