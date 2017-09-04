class CreateBannerSites < ActiveRecord::Migration
  def change
    create_table :banner_sites do |t|
      t.references :banner, index: true
      t.references :site, index: true
      t.integer :max_show, default: 100, null: false
      t.integer :show_number, default: 0
      t.integer :click_number, default: 0
      t.integer :show_time, default: 5000

      t.timestamps null: false
    end
    add_foreign_key :banner_sites, :banners
    add_foreign_key :banner_sites, :sites
  end
end
