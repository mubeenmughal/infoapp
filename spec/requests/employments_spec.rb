require 'rails_helper'

RSpec.describe "Employments", type: :request do
  describe "POST #create" do
  let(:personal_data) { PersonalData.create(first_name: "steve", last_name: "Smith", nickname: "Joe", email: "joe@example.com", phone: "555-555-5555", employment_id: 1) }

    context "with invalid parameters" do
      let(:invalid_params) { { employer: "", date_started: Date.today, personal_data_id: personal_data.id } }

      it "does not create a new employment" do
        expect {
          post employments_path, params: invalid_params
        }.not_to change(Employment, :count)
      end

      it "renders the new template with an error message" do
        post employments_path, params: invalid_params
        expect(response).to have_http_status(:forbidden)
      end
    end
  end
end
