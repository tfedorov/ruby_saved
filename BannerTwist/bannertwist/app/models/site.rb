class Site < ActiveRecord::Base
  has_many :banner_sites
  accepts_nested_attributes_for :banner_sites, allow_destroy: true

  def self.first_banner_for_host(host)
    site = Site.find_by_host!(host)
    site.banner_sites.first.context
  end

  def next_banner_site(bs_raw_id)
    # protect SQL injection
    bs_id = Integer(bs_raw_id)
    next_bs = banner_sites.where("id > #{bs_id} and show_number < max_show").limit(1).first || banner_sites.where('show_number < max_show').first
    next_bs
  end
end
