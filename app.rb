set :slim, :disable_escape => true
set :views, File.dirname(__FILE__) + '/app/views'

get '/' do
  slim :"application.html"
end
