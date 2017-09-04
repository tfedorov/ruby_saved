require 'rails_helper'

describe BannerSite do
  it 'show the next banner' do
    banner_sites = FactoryGirl.create(:site_with_banner_sites).banner_sites
    banner_site = banner_sites.find 1
    expect(banner_sites.find(2).context).to eq(banner_site.proccess_and_next)
    expect(banner_site.show_number).to eq(1)
  end
  it 'show next banner around' do
    banner_sites = FactoryGirl.create(:site_with_banner_sites).banner_sites
    expect(banner_sites.find(2).context).to eq(banner_sites.find(1).proccess_and_next)
    expect(banner_sites.find(3).context).to eq(banner_sites.find(2).proccess_and_next)
    expect(banner_sites.find(1).context).to eq(banner_sites.find(3).proccess_and_next)
  end
  it 'show the same banner twice' do
    banner_site = FactoryGirl.create(:site_with_banner_sites).banner_sites.first
    2.times { banner_site.proccess_and_next }
    expect(banner_site.show_number).to eq(2)
  end
  it 'show banner after exceeding the limit' do
    banner_site = FactoryGirl.create(:site_with_banner_sites).banner_sites.find 1
    banner_site.show_number = banner_site.max_show
    expect(banner_site.context).not_to eq(banner_site.proccess_and_next)
    expect(banner_site.show_number).to eq(banner_site.max_show)
  end
  it 'not show banner after exceeding the limit' do
    site = FactoryGirl.create(:site_with_banner_sites)
    banner_site_1 = site.banner_sites.find 1
    banner_site_2 = site.banner_sites.find 2
    banner_site_2.show_number = banner_site_2.max_show
    banner_site_2.save
    expect(site.banner_sites.find(3).context).to eq(banner_site_1.proccess_and_next)
    expect(banner_site_1.show_number).to eq(1)
  end
  it 'not show any banner after exceeding the limit' do
    site = FactoryGirl.create(:site_with_banner_sites)
    banner_site_1 = site.banner_sites.find 1
    banner_site_2 = site.banner_sites.find 2
    banner_site_3 = site.banner_sites.find 3
    banner_site_2.show_number = banner_site_2.max_show
    banner_site_2.save
    banner_site_3.show_number = banner_site_3.max_show
    banner_site_3.save
    expect(banner_site_1.context).to eq(banner_site_1.proccess_and_next)
  end
  it 'all banners after exceeding the limit' do
    site = FactoryGirl.create(:site_with_banner_sites)
    banner_site_1 = site.banner_sites.find 1
    banner_site_2 = site.banner_sites.find 2
    banner_site_3 = site.banner_sites.find 3
    banner_site_1.show_number = banner_site_1.max_show
    banner_site_1.save
    banner_site_2.show_number = banner_site_2.max_show
    banner_site_2.save
    banner_site_3.show_number = banner_site_3.max_show
    banner_site_3.save
    expect(banner_site_1.proccess_and_next).to eq({})
  end
  it 'show unique banner on the site' do
    banner_site = FactoryGirl.create(:banner_site)
    expect(banner_site.context).to eq(banner_site.proccess_and_next)
    expect(banner_site.show_number).to eq(1)
  end
  it 'show unique banner on the site after exceeding the limit' do
    banner_site = FactoryGirl.create(:banner_site)
    banner_site.show_number = banner_site.max_show
    expect(banner_site.context).to eq(banner_site.proccess_and_next)
    expect(banner_site.show_number).to eq(banner_site.max_show)
  end
end
