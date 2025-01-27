class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.boolean :email_verified

      t.timestamps
    end
  end
end
