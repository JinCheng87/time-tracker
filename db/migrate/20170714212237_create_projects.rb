class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.date :start_date, null: false
      t.date :end_date
      t.string :description, null: false
      t.integer :user_id,null: false
    end
  end
end
