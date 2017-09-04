class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :name, null: false
      t.string :uri, null: false
      t.string :link, null: false
      t.timestamps null: false
    end
  end
end
