class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :personal_datum, dependent: :destroy, class_name: "PersonalData"
  has_many :employments, dependent: :destroy
end
