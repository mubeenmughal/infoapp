require 'rails_helper'

RSpec.describe Employment, type: :model do
  # let(:personal_data) { PersonalData.create(first_name: "steve", last_name: "Smith", nickname: "Joe", email: "joe@example.com", phone: "555-555-5555", employment_id: 1) }

  it "is valid with valid attributes" do
    employment = Employment.new(employer: "Acme Inc.", date_started: Date.today)
    expect(employment).to be_valid
  end

  it "is not valid without an employer" do
    employment = Employment.new(date_started: Date.today)
    expect(employment).not_to be_valid
  end

  it "is not valid if date ended is before date started" do
    employment = Employment.new(employer: "Acme Inc.", date_started: Date.today, date_ended: Date.yesterday)
    expect(employment).not_to be_valid
    expect(employment.errors[:date_ended]).to include("cannot be before start date")
  end

  it "is not valid if date ended is the same as date started" do
    employment = Employment.new(employer: "Acme Inc.", date_started: Date.today, date_ended: Date.today)
    expect(employment).to be_valid
  end

  it "is valid if date ended is after date started" do
    employment = Employment.new(employer: "Acme Inc.", date_started: Date.today, date_ended: Date.tomorrow)
    expect(employment).to be_valid
  end
end
