class AddUserReferences < ActiveRecord::Migration[7.0]
  def change
    add_reference :employments, :user, foreign_key: true
    add_reference :personal_data, :user, foreign_key: true
  end
end
