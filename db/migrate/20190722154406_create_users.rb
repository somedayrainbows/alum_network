class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :admin
      t.string :role
      t.string :city
      t.string :state
      t.string :country
      t.string :cohort

      t.timestamps
    end
  end
end
