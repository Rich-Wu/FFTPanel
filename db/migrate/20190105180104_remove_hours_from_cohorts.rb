class RemoveHoursFromCohorts < ActiveRecord::Migration[5.2]
  def change
    remove_column :cohorts, :down, :string
    remove_column :cohorts, :hours, :integer
  end
end
