class AddCompletionDateToInitiatives < ActiveRecord::Migration[5.2]
  def change
    add_column :initiatives, :completion_date, :date
  end
end
