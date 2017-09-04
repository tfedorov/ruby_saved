require 'rails_helper'

RSpec.describe Site, type: :model do
  it 'find by host' do
  	site = FactoryGirl.create(:site_with_banner_sites)
    expect(Site.find_by_host('http://makebet.herokuapp.com/').name).to eq(site.name)
  end

  it 'next banner site' do
  	site = FactoryGirl.create(:site_with_banner_sites)
  	next_bs = site.next_banner_site(1)
  	expect(next_bs).not_to eq(site)
  	expect(next_bs.id).to eq(2)
  end

  
end
