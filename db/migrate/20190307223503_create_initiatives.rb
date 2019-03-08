class CreateInitiatives < ActiveRecord::Migration[5.2]
  def change
    create_table :initiatives do |t|
      t.string :title
      t.string :description
      t.date :target_date
      t.boolean :completion
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
