class CreateCohortsCoursesJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :cohorts, :courses do |t|
      t.index [:cohort_id, :course_id]
      t.index [:course_id, :cohort_id]
    end
  end
end
