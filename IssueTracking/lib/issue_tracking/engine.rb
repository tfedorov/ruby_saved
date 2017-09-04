module IssueTracking
  #
  class Engine < ::Rails::Engine
    Dir["#{Engine.root}/app/service_objects/*/*.rb"].each do |file|
      require file
      config.autoload_paths << file
    end
    isolate_namespace IssueTracking
  end
end
