lib_dir = Pathname.new(__FILE__).parent.join("lib")
%w(i18n.rb routing_filter/routing_filter.rb routing_filter/routing_filter/base.rb i18n_filter.rb).each do |file|
  require lib_dir.join(file).to_s if lib_dir.join(file).exist?
end

require "i18n-js"

require 'translate'

# TODO: Use new method available_locales once Rails is upgraded, see:
# http://github.com/svenfuchs/i18n/commit/411f8fe7c8f3f89e9b6b921fa62ed66cb92f3af4
def I18n.valid_locales
  I18n.backend.send(:init_translations) unless I18n.backend.initialized?
  backend.send(:translations).keys.reject { |locale| locale == :root }
end
