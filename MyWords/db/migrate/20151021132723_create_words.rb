class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.belongs_to :user, index: true

      t.text :english, limit: 3
      t.text :ukrainian, limit: 3
      t.integer :number, default: 1
      t.boolean :known, default: false
      t.boolean :correct, default: true

      t.timestamps null: false
    end

    add_index :words, :english
  end
end
