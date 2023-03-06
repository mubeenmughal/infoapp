class AddEmploymentToPersonalData < ActiveRecord::Migration[7.0]
  def change
    add_reference :personal_data, :employment, foreign_key: true
  end
end
