require "sinatra"
require "slim"
require "sass"
require "coffee-script"
require "compass"
require "sprockets"
require "sprockets-sass"
require "uglifier"
require "yui/compressor"

require './lib/helpers.rb'
require './app.rb'

use Rack::Static, :urls => ["/public"]

project_root = File.expand_path(File.dirname(__FILE__))

map '/assets' do
  assets = Sprockets::Environment.new project_root
  if ENV["RACK_ENV"] == "production"
    assets.css_compressor = YUI::CssCompressor.new
    assets.js_compressor = Uglifier.new
  end
  assets.append_path(File.join(project_root, 'app', 'assets'))
  run assets
end

map '/' do
  run Sinatra::Application
end