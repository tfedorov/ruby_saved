
FactoryGirl.define do
  factory :banner do
    transient do
      uniq_id Time.new.to_s
    end
    name { 'banner' + uniq_id }
    uri { uniq_id + 'google.com/some.jpg' }
    link {uniq_id + 'google.com'}
  end

  factory :site do
    name :site
    host 'http://makebet.herokuapp.com/'
  end

  factory :site_with_banner_sites, parent: :site do
    transient do
      number_bs 3
    end
    banner_sites { create_list :banner_site, number_bs }
  end

  factory :banner_site do
    max_show 100
    show_number 0
    click_number 0
    banner
    site
  end
end
