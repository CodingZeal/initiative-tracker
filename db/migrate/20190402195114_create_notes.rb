class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.text :body
      t.references :initiative, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
