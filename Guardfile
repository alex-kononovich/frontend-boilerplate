guard 'livereload', port: 35729 do
  watch(%r{app/views/.+\.(erb|haml|slim)})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{public/.+\.(css|js|html)})
  watch(%r{config/locales/.+\.yml})
  # Rails Assets Pipeline
  watch(%r{(app|vendor)/assets/\w+/(.+\.(css|js|html)).*})  { |m| "/assets/#{m[2]}" }
end  

guard 'cucumber' do
  watch(%r{^features/.+\.feature$})
  watch(%r{^features/support/.+$})          { 'features' }
  watch(%r{^features/step_definitions/(.+)_steps\.rb$}) { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'features' }
end

js_spec_location = "spec/javascripts/%s_spec.js.coffee"

guard 'jasmine-headless-webkit' do
  watch(%r{^app/assets/javascripts/(.*)\.js\.coffee}) { |m| js_spec_location % m[1] }
  watch(%r{^app/assets/javascripts/(.*)\.js}) { |m| js_spec_location % m[1] }
  watch(%r{^spec/javascripts/(.*)_spec\.js\.coffee}) { |m| js_spec_location % m[1] }
end
