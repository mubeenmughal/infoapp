require 'rails_helper'

RSpec.describe PersonalData, type: :model do
    subject { described_class.new(first_name: "John", last_name: "Doe", nickname: "Johnny", email: "john@example.com", phone: "555-555-5555", employment_id: 1 ) }

  describe "validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a first name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a last name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a nickname" do
      subject.nickname = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid with an invalid email format" do
      subject.email = "invalid_email"
      expect(subject).to_not be_valid
    end

    it "is not valid without a phone number" do
      subject.phone = nil
      expect(subject).to_not be_valid
    end

    it "is not valid with an invalid phone number format" do
      subject.phone = "123-4567"
      expect(subject).to_not be_valid
    end

    it "is valid with a valid phone number format" do
      subject.phone = "555-555-5555"
      expect(subject).to be_valid
    end
  end
end