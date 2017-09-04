class CreateInsertationWords < ActiveRecord::Migration
  def change
    create_table :insertation_words do |t|
      t.belongs_to :insertation, index: true, foreign_key: true
      t.belongs_to :word, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
