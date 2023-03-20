class Employment < ApplicationRecord
  has_many :personal_datum, dependent: :destroy
  belongs_to :user

  validates :employer, presence: true
  validate :start_date_before_end_date
  validate :end_date_not_before_start_date


  private

  def end_date_not_before_start_date
    if date_ended.present? && date_ended < date_started
      errors.add(:date_ended, "cannot be before start date")
    end
  end

  def start_date_before_end_date
    if date_ended.present? && date_started.present? && date_ended < date_started
      errors.add(:date_ended, "must be after start date")
    end
  end
end
