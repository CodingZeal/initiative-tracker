class AddUserIdToInitiatives < ActiveRecord::Migration[5.2]
  def change
    add_reference :initiatives, :user, foreign_key: true
  end
end
