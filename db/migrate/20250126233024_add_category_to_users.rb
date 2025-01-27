class AddCategoryToUsers < ActiveRecord::Migration[8.0]
  def change
    add_reference :users, :category, null: false, foreign_key: true
  end
end
