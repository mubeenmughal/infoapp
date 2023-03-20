class PersonalData < ApplicationRecord
  belongs_to :employment
  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :nickname, presence: true
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :phone, presence: true, format: { with: /\A\d{3}-\d{3}-\d{4}\z/, message: "must be in the format 555-555-5555" }
end
