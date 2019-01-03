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

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
