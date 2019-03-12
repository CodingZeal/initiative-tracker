# frozen_string_literal: true

class CreateInitiatives < ActiveRecord::Migration[5.2]
  def change
    create_table :initiatives do |t|
      t.string :title
      t.string :description
      t.date :target_date
      t.boolean :completion

      t.timestamps
    end
  end
end
