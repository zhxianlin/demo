class AddUserIdToEvents < ActiveRecord::Migration[5.1]
  def change

    add_column :events, :user_id, :interger

    add_index :events, :user_id
  end
end
