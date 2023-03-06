require 'rails_helper'

RSpec.describe 'PersonalData', type: :request do

  describe "#index" do
    describe "POST #create" do
      context "with invalid attributes" do
        it "does not creates a new PersonalData" do
          expect {
            post personal_data_path, params: { personal_data: { first_name: "", last_name: "Smith", nickname: "Joe", email: "joe@example.com", phone: "555-555-5555" } }
          }.to change(PersonalData, :count).by(0)
        end
  
        it "returns a forbidden response" do
          post personal_data_path, params: { personal_data: { name: "John Doe", email: "johndoe@example.com" } }
          expect(response).to have_http_status(:forbidden)
        end
      end
    end
  end  
end

