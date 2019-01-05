class RemoveIndexFromCohortsUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :cohorts_users, :id, :string
  end
end
