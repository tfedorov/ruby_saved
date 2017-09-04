ActiveAdmin.register Site do
  permit_params :name, :uri, banner_sites_attributes: [:id, :_destroy]

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs          # builds an input field for every attribute
    f.inputs 'BannerSites' do
      f.has_many :banner_sites, heading: false, allow_destroy: true do |bs|
        bs.input :max_show
        bs.input :show_number
        bs.input :click_number
        bs.input :banner, hint: image_tag(bs.object.banner.uri, width: '400') unless bs.object.banner.nil?
      end
    end
    f.actions
  end

  index do
    column :name
    column :host
    column 'Banner number' do |site|
      site.banner_sites.length
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :host
      row 'Banners number for this site' do
        site.banner_sites.length
      end
      site.banner_sites.each do |bs|
        row "Image for banner #{bs.banner_id}" do
          image_tag(bs.banner.uri, width: '400')
        end
        row "Shows for banner #{bs.banner_id}" do
          bs.show_number
        end
        row "Clicks for banner #{bs.banner_id}" do
          bs.click_number
        end
        row "Max show for banner #{bs.banner_id}" do
          bs.max_show
        end
      end
    end
    active_admin_comments
  end
end
