class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :contact
      t.string :email
      t.date :dob

      t.timestamps
    end
  end
end
