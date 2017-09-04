ActiveAdmin.register Banner do
  permit_params :name, :uri, :link
  FOLDER_PATH = 'public/images'

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs
    f.input :file, for: :image, as: :file
    insert_tag(Arbre::HTML::Div) { image_tag(f.object.uri, width: '400')  }
    actions
  end

  index do
    column :id
    column :name
    column :uri
    column 'Image' do |banner|
      image_tag(banner.uri, width: '400', alt: "image url =#{banner.uri}")
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :uri
      row :image do
        image_tag(banner.uri, width: '400')
      end
    end
    active_admin_comments
  end
  controller do
    def update(options = {}, &block)
      save_image
      super do |success, failure|
        block.call(success, failure) if block
        failure.html { render :edit }
      end
    end

    def create(options = {}, &block)
      save_image
      super do |success, failure|
        block.call(success, failure) if block
        failure.html { render :edit }
      end
    end

  private

    def save_image
      file_parameter = params[:banner].delete(:file)
      unless file_parameter.nil?
        file_path = File.join(FOLDER_PATH, file_parameter.original_filename)
        File.open(file_path, 'wb') { |f| f.write(file_parameter.read) }
        params[:banner][:uri] = 'http://' + request.host_with_port + '/images/' + file_parameter.original_filename
      end
    end
  end
end
