class AddStudentIdToDucks < ActiveRecord::Migration[5.2]
  def change
    add_column :ducks, :student_id, :string
  end
end
