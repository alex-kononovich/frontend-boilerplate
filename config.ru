require "sinatra"
require "sinatra/partial"
require "slim"
require "sass"
require "coffee-script"
require "compass"
require "sprockets"
require "sprockets-sass"

project_root = File.expand_path(File.dirname(__FILE__))

# sprockets to serve sass/coffeescript
use Rack::Static, :urls => ["/public"]
map '/assets' do
  assets = Sprockets::Environment.new project_root
  assets.append_path(File.join(project_root, 'app', 'assets'))
  assets.append_path(File.join(project_root, 'app', 'assets', 'stylesheets'))
  assets.append_path(File.join(project_root, 'app', 'assets', 'javascripts'))
  assets.append_path(File.join(project_root, 'app', 'assets', 'images'))
  run assets
end

# rack webserver
map '/' do
  run Sinatra::Application
end

# config
set :slim, :disable_escape => true
set :slim, :pretty => true
set :views, File.dirname(__FILE__) + '/app/views'
set :partial_template_engine, :slim
enable :partial_underscores

# routes
get "/" do
  slim :index
end

get '/:page' do
  slim params[:page].to_sym
end
