class RemoveCohortIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :cohort_id, :integer
  end
end
