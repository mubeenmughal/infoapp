# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Create User records
user = User.create!(email: "1234@gmail.com", password: "12345678")
# Create PersonalData records
employment = Employment.create(employer: "Google", date_started: Date.today, date_ended: Date.tomorrow, user_id: user.id)

# Create Employment records and associate with PersonalData
personal_data1 = PersonalData.create(first_name: "John", last_name: "Doe", nickname: "Johnny", email: "john.doe@example.com", phone: "555-555-5555", employment_id: employment.id, user_id: user.id)
personal_data2 = PersonalData.create(first_name: "Jane", last_name: "Smith", nickname: "Janie", email: "jane.smith@example.com", phone: "555-123-4567", employment_id: employment.id, user_id: user.id)
