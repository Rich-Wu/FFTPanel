class CreateCohortStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :cohort_students do |t|

      t.timestamps
    end
  end
end
