require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    subject {described_class.new(:email => 'test@test.com', :name => 'rsBabak', :password => 'rsPassTest', :password_confirmation => 'rsPassTest', :password_digest => 'passDig')}
   
    it "save sucessfully when all fields are set" do
      subject.valid?
      expect(subject.errors.full_messages).to be_empty
    end

    it "fail to save when the email is nil" do
      subject.email = nil
      subject.valid?
      expect(subject.errors.full_messages).not_to be_empty
    end

    it "fail to save when the name is nil" do
      subject.name = nil
      subject.valid?
      expect(subject.errors.full_messages).not_to be_empty
    end

    it "fail to save when the password is nil" do
      subject.password = nil
      subject.valid?
      expect(subject.errors.full_messages).not_to be_empty
    end

    it "fail to save when the password_confirmation is nil" do
      subject.password_confirmation = nil
      subject.valid?
      expect(subject.errors.full_messages).not_to be_empty
    end

    it "fail to save when the password and password_confirmation does not match" do
      subject.password_confirmation = '111'
      subject.valid?
      expect(subject.errors.full_messages).not_to be_empty
    end

    it "fail to save when the email address is not unique" do
      User.create(:email => 'test@test.com', :name => 'rsBabak', :password => 'rsPassTest', :password_confirmation => 'rsPassTest', :password_digest => 'passDig')
      subject.valid?
      puts "ERRRR:::: #{subject.errors.full_messages}"
      expect(subject.errors.full_messages).not_to be_empty
    end

    it "fail to save when the password length is less than 4" do
      subject.password = '111'
      subject.password_confirmation = '111'
      subject.valid?
      expect(subject.errors.full_messages).not_to be_empty
    end

  end
end
