class AddPracticeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :practice, :string
  end
end
