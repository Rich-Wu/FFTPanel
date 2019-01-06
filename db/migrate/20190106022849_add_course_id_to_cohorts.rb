class AddCourseIdToCohorts < ActiveRecord::Migration[5.2]
  def change
    add_column :cohorts, :course_id, :integer
  end
end
