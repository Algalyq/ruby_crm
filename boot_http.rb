ENV['RACK_ENV'] = 'development'

require_relative 'boot/connect_pg'

require_relative 'srv/endpoints/http_endpoints'


if ENV['RACK_ENV'] == 'development'
  module Rack
    class ShowExceptions
      def accepts_html?(env)
        false
      end
    end
  end
end