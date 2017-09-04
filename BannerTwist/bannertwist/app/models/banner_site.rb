class BannerSite < ActiveRecord::Base
  belongs_to :banner
  belongs_to :site

  def proccess_and_next
    if show_number < max_show
      self.show_number += 1
      save!
    end
    next_banner_site = site.next_banner_site(id)
    return {} if next_banner_site.nil?
    next_banner_site.context
  end

  def context
    { baner_site_id: id, uri: banner.uri, link: banner.link, show_time: show_time }
  end
end
