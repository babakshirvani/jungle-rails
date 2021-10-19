require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    let(:category) {Category.new(:name => 'Car')}
    subject {described_class.new(:name => 'Toyota', :price => 900000, :quantity => 1, :category => category)}
   
    it "save sucessfully if name, price, quantity, and category sets" do
      subject.valid?
      expect(subject.errors.full_messages).to be_empty
    end

    it "fail to save when the name is nil" do
      subject.name = nil
      subject.valid?
      expect(subject.errors.full_messages).not_to be_empty
    end

    it "fail to save when the price is nil" do
      subject.price_cents = nil
      subject.valid?
      expect(subject.errors.full_messages).not_to be_empty
    end

    it "fail to save when the quantity is nil" do
      subject.quantity = nil
      subject.valid?
      expect(subject.errors.full_messages).not_to be_empty
    end

    it "fail to save when the category is nil" do
      subject.category = nil
      subject.valid?
      expect(subject.errors.full_messages).not_to be_empty
    end


  end
end
