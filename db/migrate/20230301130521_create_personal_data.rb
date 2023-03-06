class CreatePersonalData < ActiveRecord::Migration[7.0]
  def change
    create_table :personal_data do |t|
      t.string :first_name,   limit: 25,    index: true
      t.string :last_name,    limit: 50,    index: true
      t.string :nickname,     null: false
      t.string :email,        null: false,  index: true
      t.string :phone,        null: false,  index: true

      t.timestamps
    end
  end
end
