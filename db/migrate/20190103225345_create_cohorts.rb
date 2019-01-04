class CreateCohorts < ActiveRecord::Migration[5.2]
  def change
    create_table :cohorts do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.integer :hours
      # t.references :user, foreign_key: true, null: true

      t.timestamps
    end
  end
end
