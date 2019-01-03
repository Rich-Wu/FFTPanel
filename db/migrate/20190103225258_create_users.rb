class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.integer :education
      t.string :email
      t.string :password
      t.string :avatar
      t.references :cohort, foreign_key: true
      t.boolean :instructor, default: false
      t.integer :salary

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
