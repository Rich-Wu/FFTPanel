class CreateCohortsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :cohorts_users do |t|
      t.integer :cohort_id
      t.integer :user_id

      t.timestamps
    end
  end
end
