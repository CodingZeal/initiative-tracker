class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :fullname, :string
    add_column :users, :is_admin, :boolean
    add_column :users, :team_leader_id, :integer
  end
end
