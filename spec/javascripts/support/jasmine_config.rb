require 'sprockets'
# monkey patch for jasmine 1.2.1 to get it working with sprockets in non-rails environment

# pretend that we're in rails environment
module Jasmine
  module Dependencies
    class << self
      def rails_3_asset_pipeline?
        true
      end
    end
  end
end

# Jasmine expect Rails.application.assets to return sprockets instance, so we need to fake that

# fake
module Rails
  def self.application
    @@application ||= nil
  end

  def self.application=(application)
    @@application = application
  end

  class Application
    def assets=(assets)
      @assets = assets
    end
    def assets
      @assets
    end
  end
end

# fake rails helper
module Sprockets
  module Helpers
    module IsolatedHelper
    end
  end
end

# fake rails helper
module Sprockets::Helpers::RailsHelper

  def asset_paths
    @asset_paths ||= AssetPaths.new
    @asset_paths
  end

  def asset_paths=(asset_paths)
    @asset_paths = asset_paths
  end

  class AssetPaths

    def initialize()
      @asset_environment = Jasmine::RackIntegration.sprockets
    end

    def asset_for(source, ext)
      source = source.to_s
      # return nil if is_uri?(source)
      source = rewrite_extension(source, nil, ext)
      @asset_environment[source]
    rescue Sprockets::FileOutsidePaths
      nil
    end

    def rewrite_extension(source, dir, ext)
      source_ext = File.extname(source)
      if ext && source_ext != ".#{ext}"
        if !source_ext.empty? && (asset = @asset_environment[source]) &&
              asset.pathname.to_s =~ /#{source}\Z/
          source
        else
          "#{source}.#{ext}"
        end
      else
        source
      end
    end

  end
end

# fix up js paths before passing it to render
module Jasmine
  class Config
    def js_files(spec_filter = nil)
      spec_files_to_include = spec_filter.nil? ? spec_files : match_files(spec_dir, [spec_filter])
      files = src_files.collect {|f| "/" + f.gsub(/javascripts\//, '')} + helpers.collect {|f| File.join("/assets/", f) } + spec_files_to_include.collect {|f| File.join("/assets/", f) }

      files = files.collect { |f| f.gsub(".coffee", "") }
      files
    end
    def src_files
      if simple_config['src_files']
        match_files(src_dir, simple_config['src_files'])
      else
        []
      end
    end
  end
end

module Jasmine::RackIntegration
  def self.sprockets
    @@sprockets ||= init_sprockets
    @@sprockets
  end
  def self.init_sprockets
    project_root = File.expand_path(File.join(File.dirname(__FILE__), "..", "..", ".."))
    sprockets = Sprockets::Environment.new project_root
    sprockets.append_path 'assets'
    sprockets.append_path 'spec/javascripts'
    sprockets
  end
end

Rails.application = Rails::Application.new
Rails.application.assets = Jasmine::RackIntegration.sprockets
