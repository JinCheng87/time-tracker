class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.text :password_digest, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
    end
  end
end